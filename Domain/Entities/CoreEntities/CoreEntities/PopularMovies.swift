//
//  PopularMovies.swift
//  CoreEntities
//
//  Created by Andrés Bonilla Gómez on 23/03/24.
//

import Foundation

public struct PopularMovies {
    
    public let page: Int
    public let results: [PopularMovie]
    public let totalPages: Int
    public let totalResults: Int
    
    public init(page: Int, results: [PopularMovie], totalPages: Int, totalResults: Int) {
        self.page = page
        self.results = results
        self.totalPages = totalPages
        self.totalResults = totalResults
    }
}

public struct PopularMovie {
    
    public let originalLanguage: String
    public let originalTitle: String
    public let overview: String
    public let popularity: Double
    public let poster: URL?
    public let releaseDate: Date
    public let title: String
    public let voteAverage: Double
    public let voteCount: Int
    
    public init(originalLanguage: String, originalTitle: String, 
                overview: String, popularity: Double, poster: URL?,
                releaseDate: Date, title: String,
                voteAverage: Double, voteCount: Int) {
        self.originalLanguage = originalLanguage
        self.originalTitle = originalTitle
        self.overview = overview
        self.popularity = popularity
        self.poster = poster
        self.releaseDate = releaseDate
        self.title = title
        self.voteAverage = voteAverage
        self.voteCount = voteCount
    }
}
