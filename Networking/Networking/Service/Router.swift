//
//  Router.swift
//  Networking
//
//  Created by Cenker Irmak on 7.03.2021.
//

import Foundation

public typealias NetworkRouterCompletion = (_ data: Data?,_ response: URLResponse?,_ error: Error?)->()

public typealias NetworkCompletion<T> = (Result<T, NetworkingError>) -> Void

protocol NetworkRouting {
    
    associatedtype Endpoint: EndpointType
    func request<T: Codable>(_ route: Endpoint, completion: @escaping NetworkCompletion<T>)
    func cancel()
}

public class NetworkRouter<Endpoint: EndpointType>: NetworkRouting, NetworkLogger {

    private var task: URLSessionTask?
    
    public init() {}
    
    public func request<T: Codable>(_ route: Endpoint, completion: @escaping NetworkCompletion<T>) {
        let session = URLSession.shared
        do {
            let request = try self.buildRequest(from: route)
            self.log(request: request)
            task = session.dataTask(with: request, completionHandler: { data, response, error in
                self.handleResponse(data: data, response: response, completion: completion)
            })
        } catch {
            print("error")
        }
        self.task?.resume()
    }
    
    func cancel() {
        self.task?.cancel()
    }
    
    fileprivate func buildRequest(from route: EndpointType) throws -> URLRequest {
        
        var request = URLRequest(url: route.baseURL.appendingPathComponent(route.path),
                                 cachePolicy: .reloadIgnoringLocalAndRemoteCacheData,
                                 timeoutInterval: 10.0)
        
        request.httpMethod = route.httpMethod.rawValue
        do {
            switch route.task {
            case .request:
                request.setValue("application/json", forHTTPHeaderField: "Content-Type")
            case .requestParameters(let bodyParameters,
                                    let bodyEncoding,
                                    let urlParameters):
                
                try self.configureParameters(bodyParameters: bodyParameters,
                                             bodyEncoding: bodyEncoding,
                                             urlParameters: urlParameters,
                                             request: &request)
                
            case .requestParametersAndHeaders(let bodyParameters,
                                              let bodyEncoding,
                                              let urlParameters,
                                              let additionalHeaders):
                
                self.addAdditionalHeaders(additionalHeaders, request: &request)
                try self.configureParameters(bodyParameters: bodyParameters,
                                             bodyEncoding: bodyEncoding,
                                             urlParameters: urlParameters,
                                             request: &request)
            }
            return request
        } catch {
            throw error
        }
    }
    
    fileprivate func configureParameters(bodyParameters: Parameters?,
                                         bodyEncoding: ParameterEncoding,
                                         urlParameters: Parameters?,
                                         request: inout URLRequest) throws {
        do {
            try bodyEncoding.encode(urlRequest: &request,
                                    bodyParameters: bodyParameters, urlParameters: urlParameters)
        } catch {
            throw error
        }
    }
    
    fileprivate func addAdditionalHeaders(_ additionalHeaders: HTTPHeaders?, request: inout URLRequest) {
        guard let headers = additionalHeaders else { return }
        for (key, value) in headers {
            request.setValue(value, forHTTPHeaderField: key)
        }
    }
    
    private func handleResponse<T: Codable>(data: Data?, response: URLResponse?, completion: NetworkCompletion<T>) {
        if let response = response as? HTTPURLResponse {
            let result = response.filterStatusCode()
            switch result {
            case .success:
                guard let responseData = data else {
                    completion(.failure(.emptyResponse))
                    return
                }
                do {
                    log(responseData: data)
                    let apiResponse = try JSONDecoder().decode(T.self, from: responseData)
                    completion(.success(apiResponse))
                } catch {
                    debugPrint(error)
                    completion(.failure(.decodeFailure))
                }
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
}
