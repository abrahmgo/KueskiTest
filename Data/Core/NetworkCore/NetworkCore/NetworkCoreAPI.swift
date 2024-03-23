//
//  NetworkCoreAPI.swift
//  NetworkCore
//
//  Created by Andrés Bonilla Gómez on 23/03/24.
//

import Foundation

public struct NetworkCoreAPI {
    
    public static func setup(with config: NetworkCoreAPIConfigType.Type) {
        NetworkCoreAPIConfig.shared = NetworkCoreAPIConfig(config)
    }
}
