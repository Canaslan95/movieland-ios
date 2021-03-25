//
//  MovieDetailEndpoint.swift
//  Movieland
//
//  Created by Cenker Irmak on 24.03.2021.
//

import Foundation

import Foundation
import Networking
import Common

enum MovieDetailEndpoint: EndpointType {
    
    case movieDetail(_ id: Int)
    
    var path: String {
        switch self {
        case .movieDetail(let id):
            return "movie/\(id)"
        }
    }
    
    var httpMethod: HTTPMethod {
        return .get
    }
    
    var task: HTTPTask {
        switch self {
        case .movieDetail:
            return .requestParameters(bodyParameters: nil, bodyEncoding: .urlEncoding, urlParameters: (["api_key": APIInfo.key]))
        }
    }
    
    var headers: HTTPHeaders? {
        return nil
    }
    
}
