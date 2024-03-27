//
//  APIConfig.swift
//  TheMovieDB
//
//  Created by Andrés Bonilla Gómez on 23/03/24.
//

import NetworkCore
import Keys

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
        return true
        #else
        return false
        #endif
    }
    
    static var additionalHeaders: [String: String] {
        return ["Content-Type": "application/x-www-form-urlencoded",
                "Authorization": "Bearer \(TheMovieDBKeys().api_token)"]
    }
}

