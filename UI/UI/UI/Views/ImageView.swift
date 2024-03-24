//
//  ImageView.swift
//  UI
//
//  Created by Andrés Bonilla Gómez on 23/03/24.
//

import SwiftUI
import NukeUI
import Nuke

public struct ImageView: View {
    
    public let model: ImageViewDataType
    
    public init(model: ImageViewDataType) {
        self.model = model
    }
    
    public var body: some View {
        VStack {
            LazyImage(url: model.url) { state in
                if let image = state.image {
                    image
                        .resizable()
                        .frame(width: 100, height: 150)
                        .aspectRatio(contentMode: .fill)
                } else {
                    Color.gray.opacity(0.2)
                }
            }
        }
    }
}

struct ImageViewl_Previews: PreviewProvider {
    
    static var previews: some View {
        ImageView(model: ExampleProductViewData())
    }
}

public protocol ImageViewDataType {
    
    var title: String { get }
    var url: URL? { get }
    var price: String { get }
}

public struct ExampleProductViewData: ImageViewDataType {
    
    public init() { }
    
    public let title: String = "Xbox"
    public let url: URL? = URL(string: "https://image.tmdb.org/t/p/w1280/6Dc9mMl083cVpNknWzALCw7JYPH.jpg")
    public let price: String = "$30.00"
}
