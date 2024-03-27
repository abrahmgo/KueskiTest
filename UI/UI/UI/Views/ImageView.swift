//
//  ImageView.swift
//  UI
//
//  Created by Andrés Bonilla Gómez on 23/03/24.
//

import SwiftUI
import NukeUI
import Nuke

@MainActor
public struct ImageView: View {
    
    @State private var listId = UUID()
    
    public let model: ImageViewDataType
    
    public init(model: ImageViewDataType) {
        self.model = model
    }
    
    public var body: some View {
        VStack(spacing: 16) {
            getDownloadImage()
            let rateStyle = RateStyle(rate: model.rate) ?? .almost
            let rateText = String(format: "%.0f", (model.rate))
            Text(rateText)
                .background(
                    Circle()
                        .stroke(rateStyle.stroke, lineWidth: 20)
                        .fill(rateStyle.background)
                        .frame(width: 10, height: 10))
                .padding(.bottom)
        }.frame(width: 100, height: 190)
    }
    
    @ViewBuilder
    private func getDownloadImage() -> some View {
        LazyImage(url: model.url) { state in
            if let image = state.image {
                image
                    .resizable()
                    .frame(width: 100, height: 150)
                    .aspectRatio(contentMode: .fill)
            } else {
                Color.gray.opacity(0.2)
            }
        }.pipeline(pipeline)
        
    }
    
    private let pipeline = ImagePipeline {
        $0.dataLoader = {
            let config = URLSessionConfiguration.default
            config.urlCache = nil
            return DataLoader(configuration: config)
        }()
    }
}

struct ImageViewl_Previews: PreviewProvider {
    
    static var previews: some View {
        ImageView(model: ExampleImageViewData())
    }
}

public protocol ImageViewDataType {
    
    var url: URL? { get }
    var rate: Double { get }
}

public struct ExampleImageViewData: ImageViewDataType, Identifiable {
    
    public init() { }
    
    public var id = UUID()
    public let url: URL? = URL(string: "https://image.tmdb.org/t/p/w1280/6Dc9mMl083cVpNknWzALCw7JYPH.jpg")
    public let rate: Double = 50
}
