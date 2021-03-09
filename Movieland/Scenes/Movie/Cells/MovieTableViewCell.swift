//
//  MovieTableViewCell.swift
//  Movieland
//
//  Created by Oğulcan Aslan on 9.03.2021.
//

import UIKit
import Foundation

struct MovieCellViewModel {
    var title: String?
}

class MovieTableViewCell: UITableViewCell {

    @IBOutlet private weak var containerView: UIView!
    @IBOutlet private weak var movieImageView: UIImageView!
    @IBOutlet private weak var movieTitleLabel: UILabel!
    
    func populate(with viewModel: MovieCellViewModel) {
        self.backgroundColor = .clear
        containerView.backgroundColor = .white
        containerView.layer.cornerRadius = 8
        movieTitleLabel.text = viewModel.title
    }
    
}
