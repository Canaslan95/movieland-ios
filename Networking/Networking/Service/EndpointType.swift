//
//  EndpointType.swift
//  Networking
//
//  Created by Cenker Irmak on 4.03.2021.
//

import Foundation

public protocol EndpointType {
    var baseURL: URL { get }
    var path: String { get }
    var httpMethod: HTTPMethod { get }
    var task: HTTPTask { get }
    var headers: HTTPHeaders? { get }
}

public extension EndpointType {
    var baseURL: URL {
        return URL(string: "https://api.themoviedb.org/3/")!
    }
}

