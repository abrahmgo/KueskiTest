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
                .font(model.style.font)
                .frame(maxWidth: .infinity, alignment: model.style.alignment)
            Spacer(minLength: 2)
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
    var style: TextStyle { get }
}

public struct ExampleTextViewData: TextViewDataType, Identifiable {
    
    public init() { }
    
    public var id = UUID()
    public let text: String = "Holi"
    public let style: TextStyle = .title
}

