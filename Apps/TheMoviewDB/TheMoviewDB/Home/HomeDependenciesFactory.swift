//
//  HomeDependencies.swift
//  TheMovieDB
//
//  Created by Andrés Bonilla Gómez on 24/03/24.
//

import Features
import CoreUseCases
import CoreEntities
import UI

struct HomeDependenciesFactory {
    
    static func make(router: HomeRouterType) -> ListGridDependencies {
        let usecase = GetPopularMoviesWPaginationUseCase()
        let dependencies = HomeDependencies(getPopularMoviesUseCase: usecase, 
                                            router: router)
        return ListGridDependencies(columns: 3, components: dependencies, delegate: dependencies)
    }
}
