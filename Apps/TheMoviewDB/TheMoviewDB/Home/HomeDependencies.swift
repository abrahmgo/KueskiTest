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
import Combine

class HomeDependencies: ListGridViewSetComponentsType, ListGridViewDelegate {
    
    private let getPopularMoviesUseCase: GetPopularMoviesWPaginationUseCaseType
    private let getPlayingMoviesUseCase: GetPopularMoviesWPaginationUseCaseType
    private var popularMovies: [PopularMovie] = []
    private let router: HomeRouterType
    private var currentFilter: HomeFilterType = .popular
    let titleObserver: CurrentValueSubject<String, Never>? = CurrentValueSubject("Pelicular Populares")
    
    init(getPopularMoviesUseCase: GetPopularMoviesWPaginationUseCaseType,
         getPlayingMoviesUseCase: GetPopularMoviesWPaginationUseCaseType,
         router: HomeRouterType) {
        self.getPopularMoviesUseCase = getPopularMoviesUseCase
        self.getPlayingMoviesUseCase = getPlayingMoviesUseCase
        self.router = router
    }
    
    func execute() async throws -> [Features.ListGridComponents] {
        var model = PopularMoviesRequest(includeAdult: false,
                                         includeVideo: false,
                                         language: .us,
                                         sort: .popularityDesc)
        if currentFilter == .playing {
            model.maxDate = Date()
            model.minDate = Date().addOrSubtractDay(days: -7)
            popularMovies = try await getPlayingMoviesUseCase.execute(model: model)
        } else {
            
            popularMovies = try await getPopularMoviesUseCase.execute(model: model)
        }
        let viewData = popularMovies.map({ImageViewData(url: $0.poster, rate: $0.voteAverage * 10)})
        let components = viewData.map({ListGridComponents.image(viewData: $0)})
        return components
    }
    
    func itemSelected(index: Int) {
        let movie = popularMovies[index]
        router.goTo(movie: movie)
    }
    
    func itemFilterSelected(index: Int) {
        currentFilter = elements[index] as? HomeFilterType ?? .popular
        switch currentFilter {
        case .popular:
            titleObserver?.send("Peliculas Populares")
        case .playing:
            titleObserver?.send("Peliculas de esta semana")
        }
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
