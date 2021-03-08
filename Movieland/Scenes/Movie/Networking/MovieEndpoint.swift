//
//  MovieEndpoint.swift
//  Movieland
//
//  Created by Cenker Irmak on 7.03.2021.
//

import Foundation
import Networking
import Common

enum MovieEndpoint: EndpointType {
    
    case popular(_ page: Int)
    case topRated(_ page: Int)
    
    var path: String {
        switch self {
        case .popular:
            return "movie/popular"
        case .topRated:
            return "movie/top_rated"
        }
    }
    
    var httpMethod: HTTPMethod {
        return .get
    }
    
    var task: HTTPTask {
        switch self {
        case .popular(let page):
            return .requestParameters(bodyParameters: nil,
                                      bodyEncoding: .urlEncoding,
                                      urlParameters: ["page": page,
                                                      "api_key": APIInfo.key])
        case .topRated(let page):
            return .requestParameters(bodyParameters: nil,
                                      bodyEncoding: .urlEncoding,
                                      urlParameters: ["page": page,
                                                      "api_key": APIInfo.key])
        }
    }
    
    var headers: HTTPHeaders? {
        return nil
    }
}
