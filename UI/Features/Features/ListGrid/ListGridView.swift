//
//  ListGrid.swift
//  Features
//
//  Created by Andrés Bonilla Gómez on 23/03/24.
//

import SwiftUI
import CoreEntities
import UI

struct ListGridView: View {
        
    @ObservedObject private var viewModel: ListGridViewModel
    
    init(viewModel: ListGridViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        ScrollView([.vertical], showsIndicators: true) {
            let colums = viewModel.getColumns(order: viewModel.order)
            LazyVGrid(columns: colums, spacing: 10) {
                ForEach(viewModel.components) { item in
                    self.paintComponent(component: item)
                }
                .listRowInsets(EdgeInsets())
            }
            .padding(.horizontal)
        }
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .topLeading)
        .navigationBarTitle(Text("Productos"))
    }
    
    private func paintComponent(component: ListGridComponents) -> some View {
        switch component {
        case .image(let viewData):
            return ImageView(model: viewData)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ListGridFactory.build()
    }
}