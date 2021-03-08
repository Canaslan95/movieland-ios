//
//  NetworkingError.swift
//  Networking
//
//  Created by Cenker Irmak on 7.03.2021.
//

import Foundation

public enum NetworkingError: Error {
    case failed
    case encodeFailure
    case requestBuildFailure
    case badRequest
    case authentication
    case notFound
    case internalError
    case undefined
    case decodeFailure
    case emptyResponse
    case connection
}
