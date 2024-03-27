//
//  ManageFavoriteMovieUseCase.swift
//  CoreUseCases
//
//  Created by Andrés Bonilla Gómez on 25/03/24.
//

import CoreEntities
import CoreDataSource
import APICore

public protocol ManageFavoriteMovieUseCaseType {
    func save(movie: PopularMovie) async throws
    func delete(movie: PopularMovie) async throws
    func getAll() async throws -> [PopularMovie]
}

public struct ManageFavoriteMovieUseCase: ManageFavoriteMovieUseCaseType {
    
    private let managerStorage: ManageFavoriteMovieRemoteDataSource
    
    public init(managerStorage: ManageFavoriteMovieRemoteDataSource = CoreLocalDataSource.popularMoviesAPI) {
        self.managerStorage = managerStorage
    }
    
    public func save(movie: CoreEntities.PopularMovie) async throws {
        try await managerStorage.save(movie: movie)
    }
    
    public func delete(movie: CoreEntities.PopularMovie) async throws {
        try await managerStorage.delete(movie: movie)
    }
    
    public func getAll() async throws -> [PopularMovie] {
        try await managerStorage.getAll()
    }
}
