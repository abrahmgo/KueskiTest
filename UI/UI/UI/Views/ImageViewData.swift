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
    
    public init(url: URL? = nil) {
        self.url = url
    }
}
