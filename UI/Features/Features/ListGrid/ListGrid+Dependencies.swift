//
//  ListGrid+Dependencies.swift
//  Features
//
//  Created by Andrés Bonilla Gómez on 23/03/24.
//

import CoreEntities
import Combine
import SwiftUI

protocol ListGridViewModelOutputs {
    var order: ContentOrder { get }
    var components: [ListGridComponents] { get }
    var viewTitle: String? { get }
    
    func getColumns(order: ContentOrder, side: CGFloat) -> [GridItem]
    func showFilter() -> Bool
    func getTitlesFilter() -> [String]
}

protocol ListGridViewModelInputs {
    func order(order: ContentOrder)
    func requestMoreData()
    func viewWillAppear()
}

protocol ListGridViewModelType {
    var outputs: ListGridViewModelOutputs { get }
    var inputs: ListGridViewModelInputs { get }
}

public protocol ListGridViewSetComponentsType {
    func execute() async throws -> [ListGridComponents]
}

public protocol ListGridViewFilter {
    var title: String { get }
    var elements: [any RawRepresentable] { get }
}

public struct ListGridDependencies {
    
    public let columns: Int
    public let components: ListGridViewSetComponentsType
    public let delegate: ListGridViewDelegate?
    public let reloadDataViewWillAppear: Bool
    public let withFilter: Bool
    public let dataFilter: ListGridViewFilter?
    public let titleObserver: CurrentValueSubject<String, Never>?
    
    public init(columns: Int, 
                components: ListGridViewSetComponentsType,
                delegate: ListGridViewDelegate? = nil,
                reloadDataViewWillAppear: Bool = false,
                withFilter: Bool = false,
                dataFilter: ListGridViewFilter? = nil,
                titleObserver: CurrentValueSubject<String, Never>? = nil) {
        self.columns = columns
        self.components = components
        self.delegate = delegate
        self.reloadDataViewWillAppear = reloadDataViewWillAppear
        self.withFilter = withFilter
        self.dataFilter = dataFilter
        self.titleObserver = titleObserver
    }
}
