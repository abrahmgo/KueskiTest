//
//  PopularMoviesRequest.swift
//  CoreEntities
//
//  Created by Andrés Bonilla Gómez on 23/03/24.
//

import Foundation

public struct PopularMoviesRequest {
    
    public let includeAdult: Bool
    public let includeVideo: Bool
    public let language: TheMovieDBLanguage
    public let page: Int
    public let sort: TheMovieDBSort
    public var minDate: Date?
    public var maxDate: Date?
    
    public init(includeAdult: Bool, includeVideo: Bool,
                language: TheMovieDBLanguage, page: Int = 0,
                sort: TheMovieDBSort,
                minDate: Date? = nil,
                maxDate: Date? = nil) {
        self.includeAdult = includeAdult
        self.includeVideo = includeVideo
        self.language = language
        self.page = page
        self.sort = sort
        self.minDate = minDate
        self.maxDate = maxDate
    }
}
