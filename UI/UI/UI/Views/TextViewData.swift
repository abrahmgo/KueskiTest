//
//  TextViewData.swift
//  UI
//
//  Created by Andrés Bonilla Gómez on 25/03/24.
//

import Foundation

public struct TextViewData: TextViewDataType, Identifiable {
    
    public let id = UUID()
    public let text: String
    
    public init(text: String = "") {
        self.text = text
    }
}
