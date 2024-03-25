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
    @EnvironmentObject var router: Router<ListGridPath>
    weak var delegate: ListGridViewDelegate?
    
    init(viewModel: ListGridViewModel,
         delegate: ListGridViewDelegate? = nil) {
        self.viewModel = viewModel
        self.delegate = delegate
    }
    
    var body: some View {
        GeometryReader { geometry in
            ScrollView([.vertical], showsIndicators: true) {
                let side = geometry.size.width / 4
                let colums = viewModel.getColumns(order: viewModel.order, side: side)
                LazyVGrid(columns: colums, alignment: .center) {
                    ForEach(0..<viewModel.components.count, id: \.self) { item in
                        self.paintComponent(component: viewModel.components[item])
                            .onTapGesture {
                                self.delegate?.itemSelected(index: item)
                            }
                    }
                    .listRowInsets(EdgeInsets())
                }
                .padding(.horizontal)
            }
            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .topLeading)
            .navigationBarTitle(Text("TheMoviewDB"))
        }
    }
    
    private func paintComponent(component: ListGridComponents) -> some View {
        switch component {
        case .image(let viewData):
            return ImageView(model: viewData)
        }
    }
}

public protocol ListGridViewDelegate: AnyObject {
    func itemSelected(index: Int)
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ListGridFactory.build(dependencies: ExampleListGridDependencies.dependenices)
    }
}

struct ExampleListGridDependencies {
    static let dependenices = ListGridDependencies(columns: 3, components: ExampleListGridDependenciesComponents())
}

struct ExampleListGridDependenciesComponents: ListGridViewSetComponentsType {
    func execute() async throws -> [ListGridComponents] {
        return [.image(viewData: ExampleImageViewData())]
    }
}
