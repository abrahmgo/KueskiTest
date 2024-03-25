//
//  TextView.swift
//  UI
//
//  Created by Andrés Bonilla Gómez on 25/03/24.
//

import SwiftUI

public struct TextView: View {
    
    @State private var listId = UUID()
    
    public let model: TextViewDataType
    
    public init(model: TextViewDataType) {
        self.model = model
    }
    
    public var body: some View {
        VStack(spacing: 16) {
            Text(model.text)
        }
    }
}

struct ImageView2_Previews: PreviewProvider {
    
    static var previews: some View {
        ImageView(model: ExampleImageViewData())
    }
}

public protocol TextViewDataType {
    
    var text: String { get }
}

public struct ExampleTextViewData: TextViewDataType, Identifiable {
    
    public init() { }
    
    public var id = UUID()
    public let text: String = "Holi"
}

