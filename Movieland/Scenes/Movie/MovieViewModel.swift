//
//  MovieViewModel.swift
//  Movieland
//
//  Created by Oğulcan Aslan on 9.03.2021.
//

import Foundation
import Networking
import Common

protocol MovieViewModelProtocol {
    var nowPlayingMovies: [Movie]? { get }
    var movieCellViewModelArray: [MovieCellViewModel]? { get }
    func getNowPlayingMovies(completion: @escaping VoidHandler)
    func getMovieDetail(completion: @escaping VoidHandler)
}

class MovieViewModel: MovieViewModelProtocol {
    
    var movieCellViewModelArray: [MovieCellViewModel]? = [MovieCellViewModel]()
    var nowPlayingMovies: [Movie]? = [Movie]()
    
    func getMovieDetail(completion: @escaping VoidHandler) {
        guard let nowPlayingMovies = nowPlayingMovies else { return }
        for (index, movie) in nowPlayingMovies.enumerated() {
            MovieEndpoint.movieDetail(movie.id).retrieve { (response: MovieDetailsResponse) in
                self.movieCellViewModelArray?[index].runtime = response.runtime
                self.movieCellViewModelArray?[index].genre = self.setGenre(genreArray: response.genres ?? [Genre]())
                self.movieCellViewModelArray?[index].releaseDate = response.releaseDate
                completion()
                
                
            }
        }
    }
    
    func getNowPlayingMovies(completion: @escaping VoidHandler) {
        MovieEndpoint.nowPlaying(1).retrieve { (response: NowPlayingResponse ) in
            self.nowPlayingMovies = response.results
            self.nowPlayingMovies?.forEach({ (movie) in
                self.movieCellViewModelArray?.append(MovieCellViewModel(title: movie.title,
                                                                        posterPath: movie.posterPath,
                                                                        genre: "",
                                                                        runtime: 0,
                                                                        releaseDate: ""))
            })
            self.getMovieDetail {
                completion()
            }
        }
    }
    
    func setGenre(genreArray: [Genre]) -> String {
        var genreNameArray = [String]()
        genreArray.forEach { (genre) in
            genreNameArray.append(genre.name ?? "")
        }
        return genreNameArray.joined(separator: ", ")
    }
}
