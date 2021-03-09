//
//  MovieEndpoint.swift
//  Movieland
//
//  Created by Oğulcan Aslan on 9.03.2021.
//

import Foundation
import Networking
import Common

enum MovieEndpoint: EndpointType {
    
    case nowPlaying(_ page: Int)
    
    var path: String {
        switch self {
        case .nowPlaying:
            return "movie/now_playing"
        }
    }
    
    var httpMethod: HTTPMethod {
        return .get
    }
    
    var task: HTTPTask {
        switch self {
        case .nowPlaying(let page):
            return .requestParameters(bodyParameters: nil, bodyEncoding: .urlEncoding, urlParameters: (["page": page, "api_key": APIInfo.key]))
        }
    }
    
    var headers: HTTPHeaders? {
        return nil
    }
    
    
    
}
