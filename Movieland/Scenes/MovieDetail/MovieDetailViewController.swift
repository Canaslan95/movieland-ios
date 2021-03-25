//
//  MovieDetailViewController.swift
//  Movieland
//
//  Created by Cenker Irmak on 24.03.2021.
//

import UIKit
import Kingfisher
import Common

class MovieDetailViewController: UIViewController {
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var movieImageView: UIImageView!
    @IBOutlet weak var genreLabel: UILabel!
    @IBOutlet weak var runtimeLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var overviewLabel: UILabel!
    @IBOutlet weak var runtimeImage: UIImageView!
    @IBOutlet weak var dateImage: UIImageView!
    
    var viewModel: MovieDetailViewModelProtocol
    
    init(viewModel: MovieDetailViewModel) {
        self.viewModel = viewModel
        super.init(nibName: "MovieDetailViewController", bundle: .main)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        applyStyle()
        viewModel.getMovieDetails { [weak self] in
            self?.setPageData()
        }
    }
    
    func applyStyle() {
        backButton.addTarget(self, action: #selector(backButtonAction), for: .touchUpInside)
        backButton.tintColor = .black
        titleLabel.font = .boldSystemFont(ofSize: 18)
        runtimeLabel.font = .boldSystemFont(ofSize: 16)
        runtimeImage.image = UIImage(named: "runtime_image")
        dateLabel.font = .boldSystemFont(ofSize: 16)
        dateImage.image = UIImage(named: "date_image")
        overviewLabel.font = .boldSystemFont(ofSize: 16)
        overviewLabel.lineBreakMode = .byWordWrapping
        overviewLabel.numberOfLines = 0
        genreLabel.font = .boldSystemFont(ofSize: 16)
    }
    
    func setPageData() {
        DispatchQueue.main.async {
            self.titleLabel.text = self.viewModel.movieTitle
            self.runtimeLabel.text = self.viewModel.movieRuntime?.description
            self.dateLabel.text = self.viewModel.movieDate
            self.overviewLabel.text = self.viewModel.movieOverview
            self.genreLabel.text = self.viewModel.movieGenre
            let movieImageUrl = APIInfo.posterBaseUrl.appending(self.viewModel.movieBackdDropPath ?? "")
            self.movieImageView.kf.setImage(with: URL(string: movieImageUrl))
        }
    }
    
    @objc func backButtonAction() {
        self.navigationController?.popViewController(animated: true)
    }

}
