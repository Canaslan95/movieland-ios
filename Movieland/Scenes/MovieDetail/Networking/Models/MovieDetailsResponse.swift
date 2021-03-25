//
//  MovieDetailsResponse.swift
//  Movieland
//
//  Created by Oğulcan Aslan on 10.03.2021.
//

import Foundation
import Common

struct MovieDetailsResponse: Codable {
    let title: String
    let runtime: Int?
    let overview: String?
    let genres: [Genre]?
    let releaseDate: String
    let backdropPath: String?
    
    enum CodingKeys: String, CodingKey {
        case title
        case runtime
        case overview
        case genres
        case releaseDate = "release_date"
        case backdropPath = "backdrop_path"
    }
}

