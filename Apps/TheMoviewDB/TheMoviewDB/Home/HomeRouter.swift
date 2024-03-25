//
//  HomeRouter.swift
//  TheMoviewDB
//
//  Created by Andrés Bonilla Gómez on 25/03/24.
//

import UIKit
import SwiftUI
import CoreEntities

class HomeRouter: HomeRouterType {
    weak var view: UIViewController?
    
    func goTo(movie: PopularMovie) {
        let viewController = MovieFactory.build(movie: movie)
        view?.navigationController?.pushViewController(viewController, animated: true)
    }
}

protocol HomeRouterType {
    func goTo(movie: PopularMovie)
}
