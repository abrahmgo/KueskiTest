//
//  GetPopularMoviesUseCase.swift
//  CoreUseCases
//
//  Created by Andrés Bonilla Gómez on 23/03/24.
//

import CoreEntities
import CoreDataSource
import APICore

public protocol GetPopularMoviesUseCaseType {
    func execute(model: PopularMoviesRequest) async throws -> PopularMovies
}

public struct GetPopularMoviesUseCase: GetPopularMoviesUseCaseType {
    
    private let remoteDataSource: PopularMoviesRemoteDataSource
    
    public init(remoteDataSource: PopularMoviesRemoteDataSource = CoreRemoteDataSource.popularMoviesAPI) {
        self.remoteDataSource = remoteDataSource
    }
    
    public func execute(model: PopularMoviesRequest) async throws -> PopularMovies {
        try await remoteDataSource.execute(model: model)
    }
}

/// Usecase to get popular movies with ascendent pagination, this usecase ignores the page paramter in the model that you pass it
public class GetPopularMoviesWPaginationUseCase: GetPopularMoviesUseCaseType {
    
    private let getPopularMoviesUseCase: GetPopularMoviesUseCaseType
    private var page: Int = 0
    private var totalPages: Int = 0
    
    public init(getPopularMoviesUseCase: GetPopularMoviesUseCaseType = GetPopularMoviesUseCase()) {
        self.getPopularMoviesUseCase = getPopularMoviesUseCase
    }
    
    public func execute(model: PopularMoviesRequest) async throws -> PopularMovies {
        checkPagination()
        let model = PopularMoviesRequest(includeAdult: model.includeAdult,
                                         includeVideo: model.includeVideo,
                                         language: model.language,
                                         page: page,
                                         sort: model.sort)
        let result = try await getPopularMoviesUseCase.execute(model: model)
        totalPages = result.totalPages
        return result
    }
    
    private func checkPagination() {
        if page <= totalPages {
            page += 1
        }
    }
}
