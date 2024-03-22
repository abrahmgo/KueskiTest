//
//  NetworkService.swift
//  NetworkCore
//
//  Created by Andrés Bonilla Gómez on 21/03/24.
//

import Alamofire

public protocol NetworkService {
    func request<T: Decodable>(target: NetworkTargetType) async throws -> T
}

public struct RequestNetworkProvider: NetworkService {
    
    private let manager: Session
    
    public init(timeoutIntervalForRequest: TimeInterval = 30,
                timeoutIntervalForResource: TimeInterval = 30,
                httpCookieAcceptPolicy: HTTPCookie.AcceptPolicy = .always,
                httpCookieStorage: HTTPCookieStorage = .shared,
                httpShouldSetCookies: Bool = true,
                httpAdditionalHeaders: [String: Any]) {
        
        let configuration = URLSessionConfiguration.default
        configuration.timeoutIntervalForRequest = timeoutIntervalForRequest
        configuration.timeoutIntervalForResource = timeoutIntervalForResource
        configuration.httpCookieAcceptPolicy = httpCookieAcceptPolicy
        configuration.httpCookieStorage = httpCookieStorage
        configuration.httpShouldSetCookies = httpShouldSetCookies
        configuration.httpAdditionalHeaders = httpAdditionalHeaders
        
        self.manager = Session(configuration: configuration)
    }
    
    public func request<T>(target: NetworkTargetType) async throws -> T where T : Decodable {
        
        let data = try await withCheckedThrowingContinuation { continuation in
            self.manager
                .request(target.toURL(),
                         method: target.method,
                         parameters: target.parameters,
                         encoding: target.encoding,
                         headers: target.headers,
                         interceptor: nil)
                .responseDecodable { (response: DataResponse<T, AFError>) in
                    continuation.resume(returning: response)
                }
        }
        return try await self.responseHandler(response: data, target: target)
    }
    
    private func responseHandler<Decodable>(response: DataResponse<Decodable, AFError>,
                                            target: NetworkTargetType) async throws -> Decodable {
        if let _ = try? target.toURL().asURL() {
            var error = response.error?.localizedDescription
            
            if let error = error {
                print("error \(error)")
            }
        }
        
        if let error = response.error {
            throw error
        } else if let value = response.value {
            return value
        } else {
            throw "Unknown"
        }
    }
}

public struct MockNetworkProvider: NetworkService {
    
    public init() { }
    
    public func request<T>(target: NetworkTargetType) async throws -> T where T : Decodable {
        
        let endpoint = target.toURL()
        
        print("Mock: \(endpoint)")
        
        guard let sampleData = target.sampleData else {
            throw "without sample data"
        }
        if let decoded = try? JSONDecoder().decode(T.self, from: sampleData) {
            return decoded
        } else {
            throw "error"
        }
    }
}

extension String: LocalizedError {
    
    public var errorDescription: String? {
        return self
    }
}
