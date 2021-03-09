//
//  MovieTableViewCell.swift
//  Movieland
//
//  Created by Oğulcan Aslan on 9.03.2021.
//

import UIKit
import Foundation
import Common
import Kingfisher

struct MovieCellViewModel {
    var title: String?
    var posterPath: String?
    var genre: String?
}

class MovieTableViewCell: UITableViewCell {

    @IBOutlet private weak var containerView: UIView!
    @IBOutlet private weak var movieImageView: UIImageView!
    @IBOutlet private weak var movieTitleLabel: UILabel!
    
    func populate(with viewModel: MovieCellViewModel) {
        let moviePosterUrl = APIInfo.posterBaseUrl.appending(viewModel.posterPath ?? "")
        self.backgroundColor = .clear
        containerView.backgroundColor = .white
        containerView.layer.cornerRadius = 8
        movieTitleLabel.text = viewModel.title
        movieImageView.kf.setImage(with: URL(string: moviePosterUrl))
        movieImageView.contentMode = .scaleToFill
    }
    
}
