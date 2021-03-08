//
//  ViewController.swift
//  Movieland
//
//  Created by Cenker Irmak on 2.03.2021.
//

import UIKit

class ViewController: UIViewController {
    
    var viewModel: ViewModel = ViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.getPageData { [weak self] in
            print(self?.viewModel.popularMovies?.first?.title)
            print(self?.viewModel.topRatedMovies?.first?.title)
        }
    }

}
