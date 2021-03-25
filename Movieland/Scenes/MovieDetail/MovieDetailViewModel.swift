//
//  MovieDetailViewModel.swift
//  Movieland
//
//  Created by Cenker Irmak on 24.03.2021.
//

import Foundation
import Common

protocol MovieDetailViewModelProtocol {
    var movieId: Int { get }
    var movieTitle: String? { get }
    var movieGenre: String? { get }
    var movieOverview: String? { get }
    var movieDate: String? { get }
    var movieRuntime: Int? { get }
    var movieBackdDropPath: String? { get }
    func getMovieDetails(completion: @escaping VoidHandler)
}

class MovieDetailViewModel: MovieDetailViewModelProtocol {
    var movieId: Int
    var movieTitle: String?
    var movieGenre: String?
    var movieOverview: String?
    var movieDate: String?
    var movieRuntime: Int?
    var movieBackdDropPath: String?
    
    init(movieId: Int) {
        self.movieId = movieId
    }
    
    func getMovieDetails(completion: @escaping VoidHandler) {
        MovieDetailEndpoint.movieDetail(movieId).retrieve ({ (response: MovieDetailsResponse) in
            self.movieRuntime = response.runtime
            self.movieBackdDropPath = response.backdropPath
            self.movieTitle = response.title
            self.movieOverview = response.overview
            self.movieDate = response.releaseDate
            self.movieGenre = self.setGenre(genreArray: response.genres ?? [Genre]())
            completion()
        })
    }
    
    func setGenre(genreArray: [Genre]) -> String {
        var genreNameArray = [String]()
        genreArray.forEach { (genre) in
            genreNameArray.append(genre.name ?? "")
        }
        return genreNameArray.joined(separator: ", ")
    }
    
}
