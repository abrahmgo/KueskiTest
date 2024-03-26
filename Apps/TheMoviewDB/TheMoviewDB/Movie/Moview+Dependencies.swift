//
//  Moview+Dependencies.swift
//  TheMoviewDB
//
//  Created by Andrés Bonilla Gómez on 25/03/24.
//

import CoreEntities
import CoreUseCases

protocol MovieViewModelOutputs {
    var components: [MovieComponents] { get }
    var favorite: Bool { get }
}

protocol MovieViewModelInputs { 
    
    func setFavorite(status: Bool)
}

protocol MovieViewModelType {
    var outputs: MovieViewModelOutputs { get }
    var inputs: MovieViewModelInputs { get }
}

struct MovieDependencies {
    
    let movie: PopularMovie
    let managerStorageMovieUseCase: ManageFavoriteMovieUseCaseType
    
    init(movie: PopularMovie,
         managerStorageMovieUseCase: ManageFavoriteMovieUseCaseType) {
        self.movie = movie
        self.managerStorageMovieUseCase = managerStorageMovieUseCase
    }
}
