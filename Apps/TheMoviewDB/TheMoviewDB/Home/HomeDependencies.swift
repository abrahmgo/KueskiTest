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
import SwiftUI

class HomeDependencies: ListGridViewSetComponentsType, ListGridViewDelegate {
    
    private let getPopularMoviesUseCase: GetPopularMoviesWPaginationUseCaseType
    private var popularMovies: [PopularMovie] = []
    private let router: HomeRouterType
    
    init(getPopularMoviesUseCase: GetPopularMoviesWPaginationUseCaseType,
         router: HomeRouterType) {
        self.getPopularMoviesUseCase = getPopularMoviesUseCase
        self.router = router
    }
    
    func execute() async throws -> [Features.ListGridComponents] {
        let model = PopularMoviesRequest(includeAdult: false,
                                         includeVideo: false,
                                         language: .us,
                                         sort: .popularityDesc)
        let data = try await getPopularMoviesUseCase.execute(model: model)
        let viewData = data.map({ImageViewData(url: $0.poster)})
        let components = viewData.map({ListGridComponents.image(viewData: $0)})
        popularMovies = data
        return components
    }
    
    func itemSelected(index: Int) {
        let movie = popularMovies[index]
        router.goTo(movie: movie)
    }
    
    func itemFilterSelected(index: Int) {
        print(elements[index])
    }
}

extension HomeDependencies: ListGridViewFilter {
    
    var title: String {
        get { "Movies" }
    }
    
    var elements: [any RawRepresentable] {
        get { [HomeFilterType.playing, HomeFilterType.popular] }
    }
}

enum HomeFilterType: String {
    case popular
    case playing
}
