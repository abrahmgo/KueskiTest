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
    
    private func setComponents() {
        let titleViewData = TextViewData(text: dependencies.movie.title)
        let titleComponent = MovieComponents.text(viewData: titleViewData)
        
        components = [titleComponent]
    }
}
