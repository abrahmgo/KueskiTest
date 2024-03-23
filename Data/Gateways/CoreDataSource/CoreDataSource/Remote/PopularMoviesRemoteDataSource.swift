//
//  PopularMoviesRemoteDataSource.swift
//  CoreDataSource
//
//  Created by Andrés Bonilla Gómez on 23/03/24.
//

import CoreEntities

public protocol PopularMoviesRemoteDataSource {
    func execute(model: PopularMoviesRequest) async throws -> PopularMovies
}
