//
//  ManageFavoriteMovieLocalAPI.swift
//  APICore
//
//  Created by Andrés Bonilla Gómez on 25/03/24.
//

import CoreDataSource
import CoreEntities

struct ManageFavoriteMovieLocalAPI: ManageFavoriteMovieRemoteDataSource {
    
    private let manager: RealmManager
    
    init(manager: RealmManager) {
        self.manager = manager
    }
    
    @MainActor
    func save(movie: CoreEntities.PopularMovie) async throws {
        try manager.localRealm?.write({
            let newMovie = RealmPopularMovie()
            newMovie.id = movie.id
            newMovie.originalLanguage = movie.originalLanguage
            newMovie.originalTitle = movie.originalTitle
            newMovie.overview = movie.overview
            newMovie.popularity = movie.popularity
            newMovie.poster = movie.poster?.absoluteString ?? ""
            newMovie.releaseDate = movie.releaseDate
            newMovie.title = movie.title
            newMovie.voteAverage = movie.voteAverage
            newMovie.voteCount = movie.voteCount
            manager.localRealm?.add(newMovie)
        })
    }
    
    @MainActor
    func delete(movie: CoreEntities.PopularMovie) async throws {
        let allRealMoview = manager.localRealm?.objects(RealmPopularMovie.self)
        guard let movie = allRealMoview?.filter("id == \(movie.id)") else {
            return
        }
        
        try manager.localRealm?.write {
            manager.localRealm?.delete(movie)
        }
    }
    
    @MainActor
    func getAll() async throws -> [CoreEntities.PopularMovie] {
        let allRealMoview = manager.localRealm?.objects(RealmPopularMovie.self)
        var movies: [PopularMovie] = []
        allRealMoview?.forEach({movies.append($0.mapTo())})
        return movies
    }
    
    
}
