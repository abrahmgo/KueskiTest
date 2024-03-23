//
//  PopularMoviesResponseModel.swift
//  APICore
//
//  Created by Andrés Bonilla Gómez on 23/03/24.
//

import CoreEntities

struct PopularMoviesResponseModel: Codable {
    
    let page: Int
    let results: [PopularMovieResultResponseModel]
    let total_pages: Int
    let total_results: Int
}

extension PopularMoviesResponseModel {
    
    func mapTo() -> PopularMovies {
        return PopularMovies(page: page,
                             results: results.map({$0.mapTo()}),
                             totalPages: total_pages,
                             totalResults: total_results)
    }
}

struct PopularMovieResultResponseModel: Codable {
    
    let adult: Bool
    let backdrop_path: String
    let genre_ids: [Int]
    let id: Int
    let original_language: String
    let original_title: String
    let overview: String
    let popularity: Double
    let poster_path: String
    let release_date: String
    let title: String
    let video: Bool
    let vote_average: Double
    let vote_count: Int
}

extension PopularMovieResultResponseModel {
    
    func mapTo() -> PopularMovie {
        return PopularMovie(originalLanguage: original_language,
                            originalTitle: original_title,
                            overview: overview,
                            popularity: popularity,
                            poster: poster_path,
                            releaseDate: Date(),
                            title: title,
                            voteAverage: vote_average,
                            voteCount: vote_count)
    }
}
