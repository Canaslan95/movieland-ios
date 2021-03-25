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

class MovieTableViewCell: UITableViewCell {
    
    @IBOutlet private weak var dateLabel: UILabel!
    @IBOutlet private weak var containerView: UIView!
    @IBOutlet private weak var movieImageView: UIImageView!
    @IBOutlet private weak var movieTitleLabel: UILabel!
    @IBOutlet private weak var voteAvarageLabel: UILabel!
    @IBOutlet private weak var seperatorView: UIView!
    @IBOutlet private weak var rateImage: UIImageView!
    @IBOutlet private weak var dateImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        dateLabel.font = .boldSystemFont(ofSize: 12)
        movieTitleLabel.font = .boldSystemFont(ofSize: 14)
        voteAvarageLabel.font = .boldSystemFont(ofSize: 12)
        self.backgroundColor = .clear
        self.selectionStyle = .none
        containerView.backgroundColor = .white
        containerView.layer.cornerRadius = 8
        movieImageView.contentMode = .scaleToFill
        seperatorView.backgroundColor = .black
        dateImage.image = UIImage(named: "date_image")
        rateImage.image = UIImage(named: "rate_image")
    }
    
    func populate(with viewModel: Movie) {
        let moviePosterUrl = APIInfo.posterBaseUrl.appending(viewModel.posterPath)
        movieTitleLabel.text = viewModel.title
        movieImageView.kf.setImage(with: URL(string: moviePosterUrl))
        dateLabel.text = viewModel.releaseDate
        voteAvarageLabel.text = viewModel.voteAverage.description
    }
    
}
