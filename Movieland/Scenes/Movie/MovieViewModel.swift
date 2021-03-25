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
    var popularMovies: [Movie]? { get }
    var nowPlayingMovies: [Movie]? { get }
    func fetchPageData(completion: @escaping VoidHandler)
}

class MovieViewModel: MovieViewModelProtocol {
    
    private let dispatchGroup = DispatchGroup()
    var popularMovies: [Movie]? = [Movie]()
    var nowPlayingMovies: [Movie]? = [Movie]()
    
    func fetchPageData(completion: @escaping VoidHandler) {
        dispatchGroup.executeRequests([getNowPlayingMovies(),
                                       getPopularMovies()])  { _ in
            completion()
        }
    }
    
    func getNowPlayingMovies() -> BoolFunction  {
        return { [weak self] completion in
            MovieEndpoint.nowPlaying(1).retrieve ({ (response: NowPlayingResponse) in
                self?.nowPlayingMovies = response.results
            }, dispatcher: completion)
        }
    }
    
    func getPopularMovies() -> BoolFunction {
        return { [weak self] completion in
            MovieEndpoint.popularMovies(1).retrieve ({ (response: PopularMoviesResponse) in
                self?.popularMovies = response.results
            }, dispatcher: completion)
        }
    }
}
