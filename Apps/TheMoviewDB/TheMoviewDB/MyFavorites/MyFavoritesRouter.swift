//
//  MyFavoritesRouter.swift
//  TheMoviewDB
//
//  Created by Andrés Bonilla Gómez on 25/03/24.
//

import UIKit
import SwiftUI
import CoreEntities

class MyFavoritesRouter: MyFavoritesRouterType {
    weak var view: UIViewController?
    
    func goTo(movie: PopularMovie) {
        let viewController = MovieFactory.build(movie: movie)
        viewController.hidesBottomBarWhenPushed = true
        view?.navigationController?.pushViewController(viewController, animated: true)
    }
}

protocol MyFavoritesRouterType {
    func goTo(movie: PopularMovie)
}

