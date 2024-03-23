//
//  PopularMoviesAPI.swift
//  APICore
//
//  Created by Andrés Bonilla Gómez on 23/03/24.
//

import UIKit
import NetworkCore
import CoreDataSource
import CoreEntities

struct PopularMoviesAPI {
    
    let service: NetworkService
}

extension PopularMoviesAPI: PopularMoviesRemoteDataSource {
    
    func execute(model: PopularMoviesRequest) async throws -> PopularMovies {
        let endpoint = PopularMoviesEndpoint.service(model: model)
        let request: PopularMoviesResponseModel = try await service.request(target: endpoint)
        
        return request.mapTo()
    }
}
