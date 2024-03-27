//
//  MovieViewModel.swift
//  TheMoviewDB
//
//  Created by Andrés Bonilla Gómez on 25/03/24.
//

import UI
import Utils

class MovieViewModel: MovieViewModelInputs, MovieViewModelType, MovieViewModelOutputs, ObservableObject {
    
    // MARK: Properties
    public var outputs: MovieViewModelOutputs { return self }
    public var inputs: MovieViewModelInputs { return self }
    
    // MARK: Outputs
    @Published public var components: [MovieComponents] = []
    @Published public var favorite: Bool = false
    
    // MARK: Private
    private let dependencies: MovieDependencies
    
    init(dependencies: MovieDependencies) {
        self.dependencies = dependencies
        
        setComponents()
        verifyFavorite()
    }
    
    func verifyFavorite() {
        Task {
            do {
                let data = try await dependencies.managerStorageMovieUseCase.getAll()
                let isFavorite = data.first(where: {$0.id == dependencies.movie.id})
                await MainActor.run {
                    self.favorite = (isFavorite != nil)
                }
            } catch {
                print("error al recueprar info")
            }
        }
    }
    
    func setFavorite(status: Bool) {
        favorite = status
        if status {
            Task {
                do {
                    try await dependencies.managerStorageMovieUseCase.save(movie: dependencies.movie)
                } catch {
                    print("error al guardar")
                }
            }
        } else {
            Task {
                do {
                    try await dependencies.managerStorageMovieUseCase.delete(movie: dependencies.movie)
                } catch {
                    print("error al eliminar")
                }
            }
        }
    }
    
    private func setComponents() {
        
        let titleViewData = TextViewData(text: dependencies.movie.title, style: .title)
        let titleComponent = MovieComponents.text(viewData: titleViewData)
        
        let posterViewData = ImageViewData(url: dependencies.movie.poster)
        let posterComponent = MovieComponents.image(viewData: posterViewData)
        
        let overviewTitleViewData = TextViewData(text: "Overview", style: .headline)
        let overviewTitleComponent = MovieComponents.text(viewData: overviewTitleViewData)
        
        let overviewViewData = TextViewData(text: dependencies.movie.overview)
        let overviewComponent = MovieComponents.text(viewData: overviewViewData)
        
        let releaseTitleViewData = TextViewData(text: "Release Date", style: .headline)
        let releaseTitleComponent = MovieComponents.text(viewData: releaseTitleViewData)
        
        let releaseViewData = TextViewData(text: dependencies.movie.releaseDate.toSring(format: .dayMonthYearComa))
        let releaseComponent = MovieComponents.text(viewData: releaseViewData)
        
        let languageTitleViewData = TextViewData(text: "Original Language", style: .headline)
        let languageTitleComponent = MovieComponents.text(viewData: languageTitleViewData)
        
        let languagesViewData = TextViewData(text: dependencies.movie.originalLanguage)
        let languagesComponent = MovieComponents.text(viewData: languagesViewData)
        
        let rateTitleViewData = TextViewData(text: "Rate", style: .headline)
        let rateTitleComponent = MovieComponents.text(viewData: rateTitleViewData)
        
        let rate = String(format: "%.0f", (dependencies.movie.voteAverage * 10))
        let rateViewData = TextViewData(text: rate.description + " %")
        let rateComponent = MovieComponents.text(viewData: rateViewData)
        
        components = [titleComponent, posterComponent,
                      overviewTitleComponent, overviewComponent,
                      releaseTitleComponent, releaseComponent,
                      languageTitleComponent, languagesComponent, 
                      rateTitleComponent, rateComponent]
    }
}
