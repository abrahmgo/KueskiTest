//
//  ListGridViewModel.swift
//  Features
//
//  Created by Andrés Bonilla Gómez on 23/03/24.
//

import SwiftUI
import CoreEntities
import UI
import NukeUI
import NukeExtensions

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
        
        setComponents()
    }
    
    func setComponents() {
        Task {
            do {
                print("loading")
                let components = try await dependencies.components.execute()
                print("finish")
                await MainActor.run {
                    self.components = components
                }
            } catch {
                print(error)
            }
        }
    }
    
    func order(order: ContentOrder) {
        self.order = order
    }
    
    func getColumns(order: ContentOrder, side: CGFloat) -> [GridItem] {
        switch order {
        case .list:
            return [GridItem(.fixed(side))]
        case .grid:
            let data = Array(repeatElement(GridItem(.fixed(side)), count: dependencies.columns))
            return data
        }
    }
}
