//
//  ViewModel.swift
//  Movieland
//
//  Created by Cenker Irmak on 7.03.2021.
//

import Foundation
import Networking
import Common

protocol ViewModelProtocol {
    var popularMovies: [Movie]? { get }
    var topRatedMovies: [Movie]? { get }
    func getPageData(completion: @escaping VoidHandler) 
}

class ViewModel: ViewModelProtocol {
    
    var dispatchGroup: DispatchGroup = DispatchGroup()
    var topRatedMovies: [Movie]?
    var popularMovies: [Movie]?
    
    func getPageData(completion: @escaping VoidHandler) {
        dispatchGroup.executeRequests([getTopRatedMovies(page: 1),
                                        getPopularMovies(page: 1)], completion: { completed in
            completion()
        })
    }
    
    func getTopRatedMovies(page: Int) -> BoolFunction {
        return { [weak self] completion in
            MovieEndpoint.topRated(1).retrieve ({ [weak self] (response: MovieApiResponse) in
                self?.topRatedMovies = response.movies
            }, dispatcher: completion)
        }
    }
    
    func getPopularMovies(page: Int) -> BoolFunction {
        return { [weak self] completion in
            MovieEndpoint.popular(1).retrieve ({ [weak self] (response: MovieApiResponse) in
                self?.popularMovies = response.movies
            }, dispatcher: completion)
        }
    }

}
