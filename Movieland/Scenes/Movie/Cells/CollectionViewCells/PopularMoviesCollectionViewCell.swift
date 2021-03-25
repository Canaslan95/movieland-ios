//
//  PopularMoviesCollectionViewCell.swift
//  Movieland
//
//  Created by Cenker Irmak on 24.03.2021.
//

import UIKit
import Common
import Kingfisher

class PopularMoviesCollectionViewCell: UICollectionViewCell {
   
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var containerView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.backgroundColor = .clear
        self.containerView.backgroundColor = .clear
        self.imageView.contentMode = .scaleToFill
    }
    
    func populate(popularMovie: Movie) {
        let moviePosterURL = APIInfo.posterBaseUrl.appending(popularMovie.posterPath)
        titleLabel.text = popularMovie.title
        titleLabel.textAlignment = .center
        titleLabel.font = .boldSystemFont(ofSize: 16)
        imageView.kf.setImage(with: URL(string: moviePosterURL))
        imageView.layer.cornerRadius = 8
    }
    
}
