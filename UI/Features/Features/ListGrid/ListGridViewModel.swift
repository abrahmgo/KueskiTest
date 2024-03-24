//
//  ListGridViewModel.swift
//  Features
//
//  Created by Andrés Bonilla Gómez on 23/03/24.
//

import SwiftUI
import CoreEntities
import UI

class ListGridViewModel: ListGridViewModelInputs, ListGridViewModelType, ListGridViewModelOutputs, ObservableObject {
    
    // MARK: Properties
    public var outputs: ListGridViewModelOutputs { return self }
    public var inputs: ListGridViewModelInputs { return self }
    
    // MARK: Outputs
    @Published public var order: ContentOrder = .grid
    @Published public var components: [ListGridComponents] = []
    
    // MARK: Private
    private let dependencies: ListGridDependencies
    
    init(dependencies: ListGridDependencies) {
        self.dependencies = dependencies
        
        downloadData()
    }
    
    func downloadData() { 
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            self.components = [.image(viewData: ExampleProductViewData())]
        }
    }
    
    func order(order: ContentOrder) {
//        self.order = order
    }
    
    func getColumns(order: ContentOrder) -> [GridItem] {
        switch order {
        case .list:
            return [GridItem(.flexible())]
        case .grid:
            let data = Array(repeatElement(GridItem(.flexible()), count: dependencies.columns))
            return data
        }
    }
}
