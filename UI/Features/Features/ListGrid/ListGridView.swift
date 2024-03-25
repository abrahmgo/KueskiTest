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
                    let elements = viewModel.components.count
                    ForEach(0..<elements, id: \.self) { item in
                        self.paint(component: viewModel.components[item])
                            .onTapGesture {
                                self.delegate?.itemSelected(index: item)
                            }
                            .onAppear {
                                let isLast = (item + 1) == elements
                                if isLast {
                                    viewModel.inputs.requestMoreData()
                                }
                            }
                    }
                    .listRowInsets(EdgeInsets())
                }
                .padding(.horizontal)
            }
            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .topLeading)
            .navigationBarTitle(Text("TheMoviewDB"))
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Menu {
                        Button {
                            viewModel.order(order: .list)
                        } label: {
                            Label("List", systemImage: "list.bullet")
                        }
                        Button {
                            viewModel.order(order: .grid)
                        } label: {
                            Label("Grid", systemImage: "square.grid.3x3")
                        }
                    } label: {
                        Label("View", systemImage: "viewfinder")
                            .labelStyle(.titleOnly)
                    }
                }
            }
        }
    }
    
    private func paint(component: ListGridComponents) -> some View {
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
