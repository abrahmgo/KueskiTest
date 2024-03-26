//
//  PrincipalTabBarViewController.swift
//  TheMoviewDB
//
//  Created by Andrés Bonilla Gómez on 25/03/24.
//

import UIKit
import SwiftUI

class PrincipalTabBarViewController: UITabBarController {
    override public func viewDidLoad() {
        super.viewDidLoad()
        
        setupViewControllers()
    }
    
    func setupViewControllers() {
        let firstVC = UINavigationController(rootViewController:  HomeFactory.build())
        firstVC.title = "Movies"
        firstVC.tabBarItem.image = UIImage(systemName: "popcorn.fill")
        firstVC.tabBarItem.imageInsets = UIEdgeInsets(top: 5, left: 0, bottom: -5, right: 0)
        
        let secondVC = UINavigationController(rootViewController:  MyFavoritesFactory.build())
        secondVC.title = "Favorites"
        secondVC.tabBarItem.image = UIImage(systemName: "star.fill")
        secondVC.tabBarItem.imageInsets = UIEdgeInsets(top: 5, left: 0, bottom: -5, right: 0)
        
        viewControllers = [firstVC, secondVC]
    }
}
