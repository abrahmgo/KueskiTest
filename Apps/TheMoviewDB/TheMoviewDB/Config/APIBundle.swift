//
//  APIBundle.swift
//  TheMovieDB
//
//  Created by Andrés Bonilla Gómez on 23/03/24.
//

import Foundation

enum APIBundle: String {
    
    case production = "PRODUCTION"
    case development = "DEV"
    
    var server: String {
        switch self {
        case .production:
            return "https://api.themoviedb.org/3/discover/movie"
        case .development:
            return "https://api.themoviedb.org/3/discover/movie"
        }
    }
}
