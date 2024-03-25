//
//  HomeFactory.swift
//  TheMovieDB
//
//  Created by Andrés Bonilla Gómez on 24/03/24.
//

import SwiftUI
import Features
import UIKit

struct HomeFactory {
    static func build() -> UIViewController {
        
        let router = HomeRouter()
        let dependencies = HomeDependenciesFactory.make(router: router)
        let view = ListGridFactory.build(dependencies: dependencies)
        let viewController = UIHostingController(rootView: view)
        router.view = viewController
        return viewController
    }
}
