//
//  NetworkLogger.swift
//  Networking
//
//  Created by Cenker Irmak on 7.03.2021.
//

import Foundation

protocol NetworkLogger {
    func log(request: URLRequest)
    func log(response: HTTPURLResponse)
    func log(responseData: Data?)
    
}

extension NetworkLogger {
    
    func log(request: URLRequest) {
        print("< - - - - - - - - - - Request Begin - - - - - - - - - - >")

        let urlAsString = request.url?.absoluteString ?? ""
        let urlComponents = URLComponents(string: urlAsString)

        let method = request.httpMethod != nil ? "\(request.httpMethod ?? "")" : ""
        let path = "\(urlComponents?.path ?? "")"
        let query = "\(urlComponents?.query ?? "")"

        var output: [String] = []
        output.append(urlAsString)
        output.append(method)
        output.append("\(path)\(query)")

        output.append("< - - - - - - - - Request Headers Begin - - - - - - - - >" )
        request.allHTTPHeaderFields?.forEach({
            output.append("\($0): \($1)")
        })
        output.append("< - - - - - - - - Request Headers End - - - - - - - - >")

        if let body = request.httpBody,
            let bodyString = String(data: body, encoding: .utf8), bodyString.count < 100000 {
            output.append("< - - - - - - - - - Request Body Begin - - - - - - - - - >")
            output.append(bodyString)
            output.append("< - - - - - - - - - Request Body End - - - - - - - - - >")
        }

        output.forEach({ print($0) })
        print("< - - - - - - - - - - Request End - - - - - - - - - - >")
    }

    func log(responseData: Data?) {
        print("< - - - - - - - - - - Response Begin - - - - - - - - - - >")
        if let bodyData = responseData, let json = try? JSONSerialization.jsonObject(with: bodyData),
            let jsonData = try? JSONSerialization.data(withJSONObject: json, options: .prettyPrinted) {
            let string = String(decoding: jsonData, as: UTF8.self)
            guard string.count < 100000 else { return }
            print(string)
        } else {
            print("JSON Data malformed.")
        }
        print("< - - - - - - - - - - Response End - - - - - - - - - - >")
    }

    func log(response: HTTPURLResponse) {
        print("< - - - - - - - - - - Response Begin - - - - - - - - - - >")
        print("SERVER RETURNED WITH HTTP CODE: ", "\(response.statusCode)")
        print("< - - - - - - - - - - Response End - - - - - - - - - - >")
    }
}
