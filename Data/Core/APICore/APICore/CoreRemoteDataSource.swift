//
//  CoreRemoteDataSource.swift
//  APICore
//
//  Created by Andrés Bonilla Gómez on 23/03/24.
//

import NetworkCore
import CoreDataSource

public struct CoreRemoteDataSource {
    
    public static var popularMoviesAPI: PopularMoviesRemoteDataSource {
        return PopularMoviesAPI(service: NetworkCoreAPIConfig.shared.networkService)
    }
}
