//
//  NetworkCoreConfig.swift
//  NetworkCore
//
//  Created by Andrés Bonilla Gómez on 21/03/24.
//

import Foundation

public protocol NetworkCoreAPIConfigType {
    static var baseURL: String { get }
    static var useSampleData: Bool { get }
    static var additionalHeaders: [String: String] { get }
}

public extension NetworkCoreAPIConfigType {
    
    static var additionalHeaders: [String: String] {
        return ["Content-Type": "application/x-www-form-urlencoded"]
    }
}

public final class NetworkCoreAPIConfig {
    
    public static var shared: NetworkCoreAPIConfig!
    
    public let baseURL: String
    public let useSampleData: Bool
    public let networkService: NetworkService
    
    init(_ config: NetworkCoreAPIConfigType.Type) {
        
        self.baseURL = config.baseURL
        self.useSampleData = config.useSampleData
        
        if config.useSampleData {
            self.networkService = MockNetworkProvider()
        } else {
            self.networkService = RequestNetworkProvider(httpAdditionalHeaders: config.additionalHeaders)
        }
    }
}
