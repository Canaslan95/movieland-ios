//
//  MovieDetailsResponse.swift
//  Movieland
//
//  Created by Oğulcan Aslan on 10.03.2021.
//

import Foundation
import Common

struct MovieDetailsResponse: Codable {
    
    let runtime: Int?
    let overview: String?
    let genres: [Genre]?
    let releaseDate: String
    
    enum CodingKeys: String, CodingKey {
        case runtime
        case overview
        case genres
        case releaseDate = "release_date"
    }
}

