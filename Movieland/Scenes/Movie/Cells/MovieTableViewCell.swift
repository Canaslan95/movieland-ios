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
    var runtime: Int?
    var releaseDate: String?
}

class MovieTableViewCell: UITableViewCell {
    
    @IBOutlet private weak var genreLabel: UILabel!
    @IBOutlet private weak var dateLabel: UILabel!
    @IBOutlet private weak var containerView: UIView!
    @IBOutlet private weak var movieImageView: UIImageView!
    @IBOutlet private weak var movieTitleLabel: UILabel!
    @IBOutlet private weak var runTimelabel: UILabel!
    @IBOutlet private weak var seperatorView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.backgroundColor = .clear
        self.selectionStyle = .none
        containerView.backgroundColor = .white
        containerView.layer.cornerRadius = 8
        movieImageView.contentMode = .scaleToFill
        seperatorView.backgroundColor = .black
        movieTitleLabel.font = .boldSystemFont(ofSize: 20)
    }
    
    func populate(with viewModel: MovieCellViewModel) {
        let moviePosterUrl = APIInfo.posterBaseUrl.appending(viewModel.posterPath ?? "")
        movieTitleLabel.text = viewModel.title
        movieImageView.kf.setImage(with: URL(string: moviePosterUrl))
        runTimelabel.text = viewModel.runtime?.description
        genreLabel.text = viewModel.genre
        dateLabel.text = viewModel.releaseDate
        
         
    }
    
}
