//
//  MyFavoritesFactory.swift
//  TheMoviewDB
//
//  Created by Andrés Bonilla Gómez on 25/03/24.
//

import SwiftUI
import Features
import UIKit

struct MyFavoritesFactory {
    static func build() -> UIViewController {
        
        let router = MyFavoritesRouter()
        let dependencies = MyFavoritesDependenciesFactory.make(router: router)
        let view = ListGridFactory.build(dependencies: dependencies)
        let viewController = UIHostingController(rootView: view)
        router.view = viewController
        return viewController
    }
}

