//
//  CustomTabBarController.swift
//  Movieland
//
//  Created by Cenker Irmak on 25.03.2021.
//

import Foundation
import UIKit

class CustomTabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTabBar()
        configureTabBarUI()
        configureTabBarTitleTextColors()
    }
    
    func setupTabBar() {
        
        // MovieViewController
        let moviesRootController = MoviesViewController(nibName: "MoviesViewController", bundle: .main)
        moviesRootController.tabBarItem.title = "Movies"
        moviesRootController.tabBarItem.image = #imageLiteral(resourceName: "movie_tab_unselected").withRenderingMode(.alwaysOriginal)
        moviesRootController.tabBarItem.selectedImage = #imageLiteral(resourceName: "movie_tab_selected").withRenderingMode(.alwaysOriginal)
        let moviesNavigationController = UINavigationController(rootViewController: moviesRootController)
 
        
        //TVSeriesViewController
        let tvSeriesRootController = UIViewController()
        tvSeriesRootController.view.backgroundColor = .red
        tvSeriesRootController.tabBarItem.title = "TV Series"
        tvSeriesRootController.tabBarItem.image = #imageLiteral(resourceName: "series_tab_unselected").withRenderingMode(.alwaysOriginal)
        tvSeriesRootController.tabBarItem.selectedImage = #imageLiteral(resourceName: "series_tab_selected").withRenderingMode(.alwaysOriginal)
        
        viewControllers = [moviesNavigationController, tvSeriesRootController]
    }
    
    func configureTabBarTitleTextColors() {
        
        guard let tabBarItems = tabBar.items else { return }
        tabBar.unselectedItemTintColor = .black

        for item in tabBarItems {
            item.setTitleTextAttributes([.foregroundColor: UIColor.black], for: .normal)
            item.setTitleTextAttributes([.foregroundColor: UIColor.blue], for: .selected)
        }
        
    }

    func configureTabBarUI() {
        tabBar.barTintColor = UIColor(red: 28, green: 46, blue: 30, alpha: 1)
        tabBar.layer.shadowOffset = CGSize(width: 0, height: 0)
        tabBar.layer.shadowRadius = 3
        tabBar.layer.shadowColor = UIColor.orange.cgColor
        tabBar.layer.shadowOpacity = 0.3
    }
}
 
