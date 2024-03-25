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
    public let font: Font
    
    public init(text: String = "",
                font: Font = .body) {
        self.text = text
        self.font = font
    }
}
