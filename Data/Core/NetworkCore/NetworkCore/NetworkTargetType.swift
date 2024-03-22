//
//  NetworkTargetType.swift
//  NetworkCore
//
//  Created by Andrés Bonilla Gómez on 21/03/24.
//

import Alamofire

public protocol NetworkTargetType {
    var baseURL: String { get }
    var path: String { get }
    var method: HTTPMethod { get }
    var sampleData: Data? { get }
    var parameters: Parameters? { get }
    var encoding: ParameterEncoding { get }
    var headers: HTTPHeaders? { get }
    var retry: Bool { get }
}

public extension NetworkTargetType {
    
    var sampleData: Data? {
        return nil
    }
    
    var retry: Bool {
        return false
    }
}

extension NetworkTargetType {
    
    func toURL() -> URLConvertible {
        return baseURL + path
    }
}

