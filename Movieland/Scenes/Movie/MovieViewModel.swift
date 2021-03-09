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
    func getNowPlayingMovies(completion: @escaping VoidHandler)
}

class MovieViewModel: MovieViewModelProtocol {

    var nowPlayingMovies: [Movie]? = [Movie]()
    
    func getNowPlayingMovies(completion: @escaping VoidHandler) {
        MovieEndpoint.nowPlaying(1).retrieve { (response: NowPlayingResponse ) in
            self.nowPlayingMovies = response.results
            completion()
        }
    }
}
