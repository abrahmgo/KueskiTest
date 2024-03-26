//
//  CoreLocalDataSource.swift
//  APICore
//
//  Created by Andrés Bonilla Gómez on 25/03/24.
//

import CoreDataSource

public struct CoreLocalDataSource {
    
    public static var popularMoviesAPI: ManageFavoriteMovieRemoteDataSource {
        return ManageFavoriteMovieLocalAPI(manager: RealmManager.shared)
    }
}
