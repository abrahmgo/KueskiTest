//
//  Moview+Dependencies.swift
//  TheMoviewDB
//
//  Created by Andrés Bonilla Gómez on 25/03/24.
//

import CoreEntities

protocol MovieViewModelOutputs {
    var components: [MovieComponents] { get }
}

protocol MovieViewModelInputs { }

protocol MovieViewModelType {
    var outputs: MovieViewModelOutputs { get }
    var inputs: MovieViewModelInputs { get }
}

struct MovieDependencies {
    
    let movie: PopularMovie
    
    init(movie: PopularMovie) {
        self.movie = movie
    }
}
