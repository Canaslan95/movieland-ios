//
//  NowPlayingResponse.swift
//  Movieland
//
//  Created by Oğulcan Aslan on 9.03.2021.
//

import Foundation
import Common

struct NowPlayingResponse: Codable {
    let page: Int
    let numberOfPages: Int
    let numberOfResults: Int
    let dates: Dates
    let results: [Movie]
    
    enum CodingKeys: String, CodingKey {
        case page
        case numberOfPages = "total_pages"
        case numberOfResults = "total_results"
        case dates
        case results
    }
    
}
