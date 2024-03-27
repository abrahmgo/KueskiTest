//
//  ManageFavoriteMovieUseCaseTests.swift
//  CoreUseCasesTests
//
//  Created by Andrés Bonilla Gómez on 27/03/24.
//

import XCTest
import CoreEntities
import CoreDataSource
@testable import CoreUseCases

class ManageFavoriteMovieUseCaseTests: XCTestCase {
    
    var manageFavoriteMovieUseCase: ManageFavoriteMovieUseCaseType?
    
    override func setUp() async throws {
        try await super.setUp()
        
        let manager = MockManageFavoriteMovieRemoteDataSource()
        manageFavoriteMovieUseCase = ManageFavoriteMovieUseCase(managerStorage: manager)
    }
    
    override func tearDown() async throws {
        try await super.tearDown()
        
        manageFavoriteMovieUseCase = nil
    }
    
    func testSaveMovie() async throws {
        let movie = PopularMovie(id: 1, originalLanguage: "", originalTitle: "", overview: "", popularity: 0,
                                 poster: nil, releaseDate: Date(), title: "", voteAverage: 0, voteCount: 1)
        try await manageFavoriteMovieUseCase?.save(movie: movie)
    }
    
    func testDeleteMovie() async throws {
        let movie = PopularMovie(id: 1, originalLanguage: "", originalTitle: "", overview: "", popularity: 0,
                                 poster: nil, releaseDate: Date(), title: "", voteAverage: 0, voteCount: 1)
        try await manageFavoriteMovieUseCase?.save(movie: movie)
        try await manageFavoriteMovieUseCase?.delete(movie: movie)
    }
    
    func testGetAllMovie() async throws {
        let _ = try await manageFavoriteMovieUseCase?.getAll()
    }
}
