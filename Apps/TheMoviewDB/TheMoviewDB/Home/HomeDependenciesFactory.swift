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
        let usecasePopular = GetPopularMoviesWPaginationUseCase()
        let usecasePlaying = GetPlayingMoviesWPaginationUseCase()
        let dependencies = HomeDependencies(getPopularMoviesUseCase: usecasePopular,
                                            getPlayingMoviesUseCase: usecasePlaying,
                                            router: router)
        return ListGridDependencies(columns: 3, components: dependencies, 
                                    delegate: dependencies, withFilter: true, dataFilter: dependencies)
    }
}
