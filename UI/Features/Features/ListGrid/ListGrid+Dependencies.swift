//
//  ListGrid+Dependencies.swift
//  Features
//
//  Created by Andrés Bonilla Gómez on 23/03/24.
//

import CoreEntities
import SwiftUI

protocol ListGridViewModelOutputs {
    var order: ContentOrder { get }
    var components: [ListGridComponents] { get }
    
    func getColumns(order: ContentOrder, side: CGFloat) -> [GridItem]
}

protocol ListGridViewModelInputs {
    func order(order: ContentOrder)
    func requestMoreData()
}

protocol ListGridViewModelType {
    var outputs: ListGridViewModelOutputs { get }
    var inputs: ListGridViewModelInputs { get }
}

public protocol ListGridViewSetComponentsType {
    func execute() async throws -> [ListGridComponents]
}

public struct ListGridDependencies {
    
    public let columns: Int
    public let components: ListGridViewSetComponentsType
    public let delegate: ListGridViewDelegate?
    
    
    public init(columns: Int, 
                components: ListGridViewSetComponentsType,
                delegate: ListGridViewDelegate? = nil) {
        self.columns = columns
        self.components = components
        self.delegate = delegate
    }
}
