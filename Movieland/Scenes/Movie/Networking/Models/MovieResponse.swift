//
//  MovieResponse.swift
//  Movieland
//
//  Created by Cenker Irmak on 7.03.2021.
//

import Foundation
import Common

struct MovieApiResponse: Codable {
    let page: Int
    let numberOfResults: Int
    let numberOfPages: Int
    let movies: [Movie]
    
    enum CodingKeys: String, CodingKey {
        case page
        case numberOfResults = "total_results"
        case numberOfPages = "total_pages"
        case movies = "results"
    }
}
