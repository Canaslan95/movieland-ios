//
//  Movie.swift
//  Common
//
//  Created by Cenker Irmak on 7.03.2021.
//

import Foundation

public struct Movie: Codable {
    public let id: Int
    public let posterPath: String
    public let backdrop: String
    public let title: String
    public let releaseDate: String
    public let rating: Double
    public let overview: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case posterPath = "poster_path"
        case backdrop = "backdrop_path"
        case title
        case releaseDate = "release_date"
        case rating = "vote_average"
        case overview
    }
}
