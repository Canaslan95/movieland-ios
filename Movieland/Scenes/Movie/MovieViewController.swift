//
//  MovieViewController.swift
//  Movieland
//
//  Created by Oğulcan Aslan on 9.03.2021.
//

import Foundation
import UIKit
import Common
import Kingfisher

class MovieViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    let viewModel: MovieViewModelProtocol = MovieViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registerCells()
        setupUI()
    }
    
    func registerCells() {
        tableView.register(UINib(nibName: "MovieTableViewCell", bundle: nil), forCellReuseIdentifier: "MovieTableViewCell")
    }
    
    func setupUI() {
        tableView.backgroundColor = .lightGray
        tableView.separatorStyle = .none
        self.viewModel.getNowPlayingMovies { [weak self] in
            DispatchQueue.main.async {
                self?.tableView.reloadData()
            }
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.nowPlayingMovies?.count ?? 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MovieTableViewCell") as? MovieTableViewCell
        cell?.populate(with: MovieCellViewModel(title: viewModel.nowPlayingMovies?[indexPath.row].title ?? "",
                                                posterPath: viewModel.nowPlayingMovies?[indexPath.row].posterPath,
                                                genre: ""))
        return cell ?? UITableViewCell()
    }
}

