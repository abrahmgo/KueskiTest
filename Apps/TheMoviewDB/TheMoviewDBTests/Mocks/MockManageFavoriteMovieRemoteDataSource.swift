//
//  MockManageFavoriteMovieRemoteDataSource.swift
//  CoreUseCasesTests
//
//  Created by Andrés Bonilla Gómez on 27/03/24.
//

import CoreDataSource
import CoreEntities

struct MockManageFavoriteMovieRemoteDataSource: ManageFavoriteMovieRemoteDataSource {
    func save(movie: CoreEntities.PopularMovie) async throws { }
    
    func delete(movie: CoreEntities.PopularMovie) async throws { }
    
    func getAll() async throws -> [CoreEntities.PopularMovie] { return [] }
}
