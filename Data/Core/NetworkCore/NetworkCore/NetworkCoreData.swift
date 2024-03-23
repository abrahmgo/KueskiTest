//
//  NetworkCoreData.swift
//  NetworkCore
//
//  Created by Andrés Bonilla Gómez on 23/03/24.
//

import Foundation

public struct NetworkCoreData<T: Decodable>: Decodable {

    public let data: T?
    public let error: NetworkCoreError?
    
    public func getError() -> String? {
        
        guard let networkCoreError = error else {
            return nil
        }
        
        return networkCoreError.message
    }
}

extension NetworkCoreData: CustomDebugStringConvertible {
    
    public var debugDescription: String {
        
        guard let errorMessage = error?.message else {
            return ""
        }
        
        return errorMessage
    }
}

