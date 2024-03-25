//
//  MovieViewModel.swift
//  TheMoviewDB
//
//  Created by Andrés Bonilla Gómez on 25/03/24.
//

import UI

class MovieViewModel: MovieViewModelInputs, MovieViewModelType, MovieViewModelOutputs, ObservableObject {
    
    // MARK: Properties
    public var outputs: MovieViewModelOutputs { return self }
    public var inputs: MovieViewModelInputs { return self }
    
    // MARK: Outputs
    @Published public var components: [MovieComponents] = []
    
    // MARK: Private
    private let dependencies: MovieDependencies
    
    init(dependencies: MovieDependencies) {
        self.dependencies = dependencies
        
        setComponents()
    }
    
    func setFavorite(status: Bool) {
        print(status)
    }
    
    private func setComponents() {
        
        let titleViewData = TextViewData(text: dependencies.movie.title, font: .largeTitle)
        let titleComponent = MovieComponents.text(viewData: titleViewData)
        
        let posterViewData = ImageViewData(url: dependencies.movie.poster)
        let posterComponent = MovieComponents.image(viewData: posterViewData)
        
        let genresViewData = TextViewData(text: dependencies.movie.title)
        let genresComponent = MovieComponents.text(viewData: genresViewData)
        
        let overviewViewData = TextViewData(text: dependencies.movie.overview)
        let overviewComponent = MovieComponents.text(viewData: overviewViewData)
        
        let popularityViewData = TextViewData(text: dependencies.movie.popularity.description)
        let popularityComponent = MovieComponents.text(viewData: popularityViewData)
        
        let releaseViewData = TextViewData(text: dependencies.movie.releaseDate.description)
        let releaseComponent = MovieComponents.text(viewData: releaseViewData)
        
        let languagesViewData = TextViewData(text: dependencies.movie.originalLanguage)
        let languagesComponent = MovieComponents.text(viewData: languagesViewData)
        
        let rateViewData = TextViewData(text: dependencies.movie.voteAverage.description)
        let rateComponent = MovieComponents.text(viewData: rateViewData)
        
        let statusViewData = TextViewData(text: dependencies.movie.title)
        let statusComponent = MovieComponents.text(viewData: statusViewData)
        
        components = [titleComponent, posterComponent, genresComponent, overviewComponent,
                      popularityComponent, releaseComponent, languagesComponent, rateComponent,
                      statusComponent]
    }
}
