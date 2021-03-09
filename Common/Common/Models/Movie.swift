//
//  Movie.swift
//  Common
//
//  Created by Oğulcan Aslan on 9.03.2021.
//

import Foundation

public struct Movie: Codable {
    public let title: String
    public let posterPath: String
    public let releaseDate: String
    public let id: Int
    public let voteAverage: Double
    
    enum CodingKeys: String, CodingKey {
        
        case title
        case posterPath = "poster_path"
        case releaseDate = "release_date"
        case id
        case voteAverage = "vote_average"
        
    }
}
