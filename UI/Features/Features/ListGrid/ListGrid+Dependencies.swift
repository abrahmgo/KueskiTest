//
//  ListGrid+Dependencies.swift
//  Features
//
//  Created by Andrés Bonilla Gómez on 23/03/24.
//

import CoreEntities
import SwiftUI

public protocol ListGridViewModelOutputs {
    var order: ContentOrder { get }
    var components: [ListGridComponents] { get }
    
    func getColumns(order: ContentOrder) -> [GridItem]
}

public protocol ListGridViewModelInputs {
    func order(order: ContentOrder)
}

public protocol ListGridViewModelType {
    var outputs: ListGridViewModelOutputs { get }
    var inputs: ListGridViewModelInputs { get }
}

public struct ListGridDependencies {
    var columns: Int
}
