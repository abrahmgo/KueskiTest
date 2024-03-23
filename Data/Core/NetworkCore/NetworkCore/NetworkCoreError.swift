//
//  NetworkCoreError.swift
//  NetworkCore
//
//  Created by Andrés Bonilla Gómez on 23/03/24.
//

import Foundation

public struct NetworkCoreError: Codable {
    
    public let message: String?
    public let code: Int?
    public let ref: String?
}
