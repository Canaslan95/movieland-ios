//
//  GalleryTableViewCell.swift
//  Movieland
//
//  Created by Cenker Irmak on 24.03.2021.
//

import UIKit
import Common

class GalleryTableViewCell: UITableViewCell, UICollectionViewDelegate, UICollectionViewDataSource {
   
    @IBOutlet weak var collectionView: UICollectionView!
    
    var popularMovies: [Movie]? = [Movie]()
    var navigationController: UINavigationController = UINavigationController()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.backgroundColor = .clear
        collectionView.backgroundColor = .clear
        collectionView.delegate = self
        collectionView.dataSource = self
        if let layout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            layout.scrollDirection = .horizontal
        }
        collectionView.register(UINib(nibName: "PopularMoviesCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "PopularMoviesCollectionViewCell")
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return popularMovies?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PopularMoviesCollectionViewCell", for: indexPath as IndexPath) as! PopularMoviesCollectionViewCell
        guard let popularMovies = popularMovies else { return UICollectionViewCell() }
        cell.populate(popularMovie: popularMovies[indexPath.row])
        return cell
        
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let viewModel = MovieDetailViewModel(movieId: self.popularMovies?[indexPath.row].id ?? 0)
        let controller = MovieDetailViewController(viewModel: viewModel)
        self.navigationController.pushViewController(controller, animated: true)
    }
    
    
    func populate(popularMovies: [Movie], navigationController: UINavigationController) {
        self.navigationController = navigationController
        self.popularMovies = popularMovies
        DispatchQueue.main.async {
            self.collectionView.reloadData()
        }
    }
    
}

extension GalleryTableViewCell: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: self.frame.width, height: 240)
    }
    
}
