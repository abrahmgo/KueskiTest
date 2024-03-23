//
//  TheMovieDBApp.swift
//  TheMovieDB
//
//  Created by Andrés Bonilla Gómez on 21/03/24.
//

import SwiftUI
import NetworkCore

@main
struct TheMovieDBApp: App {
    
    init() {
        NetworkCoreAPI.setup(with: APIConfig.self)
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
