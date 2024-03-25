//
//  HomeFactory.swift
//  TheMovieDB
//
//  Created by Andrés Bonilla Gómez on 24/03/24.
//

import SwiftUI
import Features

struct HomeFactory {
    
    @ViewBuilder
    static func build() -> some View {
        let dependencies = HomeDependencies.make()
        ListGridFactory.build(dependencies: dependencies)
    }
}
