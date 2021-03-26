//
//  MoviesViewController.swift
//  Movieland
//
//  Created by Cenker Irmak on 25.03.2021.
//

import UIKit
import Common

class MoviesViewController: UIViewController,  UITableViewDelegate, UITableViewDataSource  {
    
    @IBOutlet weak var tableView: UITableView!
    
    let viewModel: MoviesViewModelProtocol = MoviesViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registerCells()
        setupUI()
    }
    
    func registerCells() {
        tableView.register(UINib(nibName: "MovieTableViewCell", bundle: nil), forCellReuseIdentifier: "MovieTableViewCell")
        tableView.register(UINib(nibName: "GalleryTableViewCell", bundle: nil), forCellReuseIdentifier: "GalleryTableViewCell")
    }
    
    func setupUI() {
        self.navigationController?.isNavigationBarHidden = true
        tableView.backgroundColor = .lightGray
        tableView.separatorStyle = .none
        self.viewModel.fetchPageData { [weak self] in
            DispatchQueue.main.async {
                self?.tableView.reloadData()
            }
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return ""
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        } else {
            return viewModel.nowPlayingMovies?.count ?? 1
        }
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = UIView()
        let titleLabel = UILabel(frame: CGRect(x: 20, y: 10, width: 300, height: 20))
        view.backgroundColor = .clear
        titleLabel.textColor = .white
        titleLabel.font = UIFont.monospacedSystemFont(ofSize: 20, weight: .bold)
        
        if section == 0 {
            titleLabel.text = "Popular Movies"
            view.addSubview(titleLabel)
            return view
        } else {
            titleLabel.text = "Now Playing Movies"
            view.addSubview(titleLabel)
            return view
        }
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 40
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return .leastNormalMagnitude
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "GalleryTableViewCell") as? GalleryTableViewCell
            cell?.populate(popularMovies: viewModel.popularMovies ?? [Movie](), navigationController: self.navigationController ?? UINavigationController())
            return cell ?? UITableViewCell()
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "MovieTableViewCell") as? MovieTableViewCell
            guard let nowPlayingMovies = viewModel.nowPlayingMovies else { return UITableViewCell() }
            cell?.populate(with: nowPlayingMovies[indexPath.row])
            return cell ?? UITableViewCell()
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let viewModel = MovieDetailViewModel(movieId: self.viewModel.nowPlayingMovies?[indexPath.row].id ?? 0)
        let controller = MovieDetailViewController(viewModel: viewModel)
        self.navigationController?.pushViewController(controller, animated: true)
    }
    
}

