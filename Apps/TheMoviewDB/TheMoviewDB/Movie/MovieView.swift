//
//  MovieView.swift
//  TheMoviewDB
//
//  Created by Andrés Bonilla Gómez on 25/03/24.
//

import SwiftUI
import UI

struct MovieView: View {
    
    @ObservedObject private var viewModel: MovieViewModel
    
    init(viewModel: MovieViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        ScrollView([.vertical], showsIndicators: true) {
            ForEach(0..<viewModel.components.count, id: \.self) { item in
                self.paint(component: viewModel.components[item])
            }
            .listRowInsets(EdgeInsets())
        }
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .topLeading)
    }
    
    @ViewBuilder
    private func paint(component: MovieComponents) -> some View {
        switch component {
        case .image(let viewData):
            ImageView(model: viewData)
        case .text(let viewData):
            TextView(model: viewData)
        }
    }
}
