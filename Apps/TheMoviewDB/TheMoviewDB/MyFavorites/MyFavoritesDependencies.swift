//
//  MyFavoritesDependencies.swift
//  TheMoviewDB
//
//  Created by Andrés Bonilla Gómez on 25/03/24.
//

import Features
import CoreUseCases
import CoreEntities
import UI
import SwiftUI

class MyFavoritesDependencies: ListGridViewSetComponentsType, ListGridViewDelegate {    

    private let managerFavoriteMovieUseCase: ManageFavoriteMovieUseCaseType
    private var popularMovies: [PopularMovie] = []
    private let router: MyFavoritesRouterType
    
    init(managerFavoriteMovieUseCase: ManageFavoriteMovieUseCaseType,
         router: MyFavoritesRouterType) {
        self.managerFavoriteMovieUseCase = managerFavoriteMovieUseCase
        self.router = router
    }
    
    func execute() async throws -> [Features.ListGridComponents] {
        let data = try await managerFavoriteMovieUseCase.getAll()
        let viewData = data.map({ImageViewData(url: $0.poster)})
        var components = viewData.map({ListGridComponents.image(viewData: $0)})
        popularMovies = data
        if components.isEmpty {
            components = [.text(viewData: TextViewData(text: "Sin favoritos",
                                                       style: .title))]
        }
        return components
    }
    
    func itemSelected(index: Int) {
        let movie = popularMovies[index]
        router.goTo(movie: movie)
    }
}
