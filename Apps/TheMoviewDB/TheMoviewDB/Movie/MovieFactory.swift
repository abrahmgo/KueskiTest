//
//  MovieFactory.swift
//  TheMoviewDB
//
//  Created by Andrés Bonilla Gómez on 25/03/24.
//

import SwiftUI
import Features
import UIKit
import CoreEntities
import CoreUseCases

struct MovieFactory {
    static func build(movie: PopularMovie) -> UIViewController {
        
        let usecase = ManageFavoriteMovieUseCase()
        let dependencies = MovieDependencies(movie: movie, managerStorageMovieUseCase: usecase)
        let viewModel = MovieViewModel(dependencies: dependencies)
        let view = MovieView(viewModel: viewModel)
        let viewController = UIHostingController(rootView: view)
        return viewController
    }
}

