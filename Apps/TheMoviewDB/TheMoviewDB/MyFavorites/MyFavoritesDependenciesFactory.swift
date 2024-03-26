//
//  MyFavoritesDependenciesFactory.swift
//  TheMoviewDB
//
//  Created by Andrés Bonilla Gómez on 25/03/24.
//

import Features
import CoreUseCases
import CoreEntities
import UI

struct MyFavoritesDependenciesFactory {
    
    static func make(router: MyFavoritesRouterType) -> ListGridDependencies {
        let usecase = ManageFavoriteMovieUseCase()
        let dependencies = MyFavoritesDependencies(managerFavoriteMovieUseCase: usecase,
                                                   router: router)
        return ListGridDependencies(columns: 3, components: dependencies, 
                                    delegate: dependencies,
                                    reloadDataViewWillAppear: true)
    }
}
