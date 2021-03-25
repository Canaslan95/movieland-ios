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
    
    case movieDetail(_ id: Int)
    case nowPlaying(_ page: Int)
    case popularMovies(_ page: Int)
    
    var path: String {
        switch self {
        case .nowPlaying:
            return "movie/now_playing"
        case .movieDetail(let id):
            return "movie/\(id)"
        case .popularMovies:
            return "movie/popular"
        }
    }
    
    var httpMethod: HTTPMethod {
        return .get
    }
    
    var task: HTTPTask {
        switch self {
        case .nowPlaying(let page):
            return .requestParameters(bodyParameters: nil, bodyEncoding: .urlEncoding, urlParameters: (["page": page, "api_key": APIInfo.key]))
        case .movieDetail:
            return .requestParameters(bodyParameters: nil, bodyEncoding: .urlEncoding, urlParameters: (["api_key": APIInfo.key]))
        case .popularMovies( _):
            return.requestParameters(bodyParameters: nil, bodyEncoding: .urlEncoding, urlParameters: (["api_key": APIInfo.key]))
        }
    }
    
    var headers: HTTPHeaders? {
        return nil
    }
    
}
