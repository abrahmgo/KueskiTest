//
//  ImageViewData.swift
//  UI
//
//  Created by Andrés Bonilla Gómez on 24/03/24.
//

import Foundation

public struct ImageViewData: ImageViewDataType, Identifiable {
    
    public let id = UUID()
    public let url: URL?
    public let rate: Double
    
    public init(url: URL? = nil, rate: Double = 0) {
        self.url = url
        self.rate = rate
    }
}
