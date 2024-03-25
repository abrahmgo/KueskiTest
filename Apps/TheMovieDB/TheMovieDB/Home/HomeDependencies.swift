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

struct HomeDependenciesComponents: ListGridViewSetComponentsType {
    
    private let getPopularMoviesUseCase: GetPopularMoviesUseCaseType
    
    init(getPopularMoviesUseCase: GetPopularMoviesUseCaseType) {
        self.getPopularMoviesUseCase = getPopularMoviesUseCase
    }
    
    func execute() async throws -> [Features.ListGridComponents] {
        let model = PopularMoviesRequest(includeAdult: false,
                                         includeVideo: false,
                                         language: .us,
                                         sort: .popularityDesc)
        let data = try await getPopularMoviesUseCase.execute(model: model)
        let viewData = data.results.map({ImageViewData(url: URL(string: $0.poster))})
        let components = viewData.map({ListGridComponents.image(viewData: $0)})
        return components
    }
}

struct HomeDependencies {
    
    static func make() -> ListGridDependencies {
        let usecase = GetPopularMoviesWPaginationUseCase()
        let components = HomeDependenciesComponents(getPopularMoviesUseCase: usecase)
        return ListGridDependencies(columns: 3, components: components)
    }
}
