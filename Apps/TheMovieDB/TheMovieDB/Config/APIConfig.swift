//
//  APIConfig.swift
//  TheMovieDB
//
//  Created by Andrés Bonilla Gómez on 23/03/24.
//

import NetworkCore

struct APIConfig: NetworkCoreAPIConfigType {
    
    static var baseURL: String {
        #if DEBUG
        
        return APIBundle.development.server
        
        #else
        return APIBundle.production.server
        
        #endif
    }
    
    static var useSampleData: Bool {
        #if DEBUG
        return false
        #else
        return false
        #endif
    }
    
    static var additionalHeaders: [String: String] {
        return ["Content-Type": "application/x-www-form-urlencoded",
                "Authorization": "Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJmMmM2NTgwZjdkNzdkMjYwOWE0ODY1MDI0MTI4Y2JmNiIsInN1YiI6IjY1ZmNmNmJjYmU2ZDg4MDE3ZGIxY2NjYyIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.c-X-b86zzR9gHbifB_cfNyONZsa3uVg11wa2CHlIi3Y"]
    }
}

