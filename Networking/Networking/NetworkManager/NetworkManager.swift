//
//  NetworkManager.swift
//  Networking
//
//  Created by Cenker Irmak on 7.03.2021.
//

import Foundation

public enum NetworkResponse: String {
    case success
    case authenticationError = "You need to be authenticated first."
    case badRequest = "Bad request"
    case outdated = "The url you requested is outdated."
    case failed = "Network request failed."
    case noData = "Response returned with no data to decode."
    case unableToDecode = "We could not decode the response."
}

extension HTTPURLResponse: NetworkLogger {}

extension HTTPURLResponse {

    func filterStatusCode() -> Result<Codable?, NetworkingError> {
        if statusCode != 200 || statusCode != 201 {
            log(response: self)
        }

        switch statusCode {
        case 200, 201: return .success(nil)
        case 400: return .failure(.badRequest)
        case 401: return .failure(.authentication)
        case 404: return .failure(.notFound)
        case 500: return .failure(.internalError)
        default:
            return .failure(.undefined)
        }
    }

}
