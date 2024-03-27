//
//  GetPlayingMoviesUseCase.swift
//  CoreUseCases
//
//  Created by Andrés Bonilla Gómez on 26/03/24.
//

import CoreEntities
import CoreDataSource
import APICore

/// Usecase to get popular movies with ascendent pagination, this usecase ignores the page paramter in the model that you pass it
public class GetPlayingMoviesWPaginationUseCase: GetPopularMoviesWPaginationUseCaseType {
    
    private let getPopularMoviesUseCase: GetPopularMoviesUseCaseType
    private var page: Int = 0
    private var totalPages: Int = 0
    private var movies: [PopularMovie] = []
    
    public init(getPopularMoviesUseCase: GetPopularMoviesUseCaseType = GetPopularMoviesUseCase()) {
        self.getPopularMoviesUseCase = getPopularMoviesUseCase
    }
    
    public func execute(model: PopularMoviesRequest) async throws -> [PopularMovie] {
        checkPagination()
        let model = PopularMoviesRequest(includeAdult: model.includeAdult,
                                         includeVideo: model.includeVideo,
                                         language: model.language,
                                         page: page,
                                         sort: model.sort,
                                         minDate: model.minDate,
                                         maxDate: model.maxDate)
        let result = try await getPopularMoviesUseCase.execute(model: model)
        totalPages = result.totalPages
        movies += result.results
        return movies
    }
    
    private func checkPagination() {
        if page <= totalPages {
            page += 1
        }
    }
}

