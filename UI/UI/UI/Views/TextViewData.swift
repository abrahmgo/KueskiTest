//
//  TextViewData.swift
//  UI
//
//  Created by Andrés Bonilla Gómez on 25/03/24.
//

import SwiftUI

public struct TextViewData: TextViewDataType, Identifiable {
    
    public let id = UUID()
    public let text: String
    public let style: TextStyle
    
    public init(text: String = "",
                style: TextStyle = .body) {
        self.text = text
        self.style = style
    }
}
