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
                if let title = viewModel.outputs.viewTitle {
                    Text(title)
                        .font(.title)
                }
                let side = geometry.size.width / 4
                let colums = viewModel.outputs.getColumns(order: viewModel.order, side: side)
                let elements = viewModel.outputs.components.count
                let firstText = viewModel.outputs.components.first(where: { item in
                    if case .text = item {
                        return true
                    }
                    return false
                })
                if (firstText != nil) {
                    ForEach(0..<elements, id: \.self) { item in
                        self.paint(component: viewModel.outputs.components[item])
                    }
                    .listRowInsets(EdgeInsets())
                    .padding(.horizontal)
                } else {
                    LazyVGrid(columns: colums, alignment: .center) {
                        ForEach(0..<elements, id: \.self) { item in
                            self.paint(component: viewModel.outputs.components[item])
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
            }
            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .topLeading)
            .navigationBarTitle(Text("TheMoviewDB"))
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Menu {
                        Button {
                            viewModel.inputs.order(order: .list)
                        } label: {
                            Label("List", systemImage: "list.bullet")
                        }
                        Button {
                            viewModel.inputs.order(order: .grid)
                        } label: {
                            Label("Grid", systemImage: "square.grid.3x3")
                        }
                    } label: {
                        Label("View", systemImage: "viewfinder")
                            .labelStyle(.titleOnly)
                    }
                }
                if viewModel.outputs.showFilter() {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Menu {
                            let elements = viewModel.outputs.getTitlesFilter()
                            ForEach(0..<elements.count, id: \.self) { item in
                                Button {
                                    delegate?.itemFilterSelected(index: item)
                                    viewModel.inputs.requestMoreData()
                                } label: {
                                    Label(elements[item], systemImage: "line.3.horizontal.decrease.circle")
                                }
                            }
                            
                        } label: {
                            Label("Filtro", systemImage: "viewfinder")
                                .labelStyle(.titleOnly)
                        }
                    }
                }
            }
            .onAppear {
                viewModel.inputs.viewWillAppear()
            }
        }
    }
    
    @ViewBuilder
    private func paint(component: ListGridComponents) -> some View {
        switch component {
        case .image(let viewData):
            ImageView(model: viewData)
        case .text(let viewData):
            TextView(model: viewData)
        }
    }
}

public protocol ListGridViewDelegate: AnyObject {
    func itemSelected(index: Int)
    func itemFilterSelected(index: Int)
}

public extension ListGridViewDelegate {
    func itemFilterSelected(index: Int) { }
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
