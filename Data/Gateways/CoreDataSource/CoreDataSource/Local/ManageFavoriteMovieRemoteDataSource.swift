//
//  ManageFavoriteMovieRemoteDataSource.swift
//  CoreDataSource
//
//  Created by Andrés Bonilla Gómez on 25/03/24.
//

import CoreEntities

public protocol ManageFavoriteMovieRemoteDataSource {
    @MainActor
    func save(movie: PopularMovie) async throws
    @MainActor
    func delete(movie: PopularMovie) async throws
    @MainActor
    func getAll() async throws -> [PopularMovie]
}
