//
//  ListGridFactory.swift
//  Features
//
//  Created by Andrés Bonilla Gómez on 23/03/24.
//

import SwiftUI

public struct ListGridFactory {
    
    @ViewBuilder
    public static func build() -> some View {
        let dependencies = ListGridDependencies(columns: 3)
        let viewModel = ListGridViewModel(dependencies: dependencies)
        ListGridView(viewModel: viewModel)
    }
}
