//
//  PopularMoviesResponse.swift
//  Movieland
//
//  Created by Cenker Irmak on 24.03.2021.
//

import Foundation
import Common

struct PopularMoviesResponse: Codable {
    let page: Int
    let numberOfPages: Int
    let numberOfResults: Int
    let results: [Movie]
    
    enum CodingKeys: String, CodingKey {
        case page
        case numberOfPages = "total_pages"
        case numberOfResults = "total_results"
        case results
    }
    
}
