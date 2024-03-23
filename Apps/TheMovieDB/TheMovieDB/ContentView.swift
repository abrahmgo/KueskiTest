//
//  ContentView.swift
//  TheMovieDB
//
//  Created by Andrés Bonilla Gómez on 21/03/24.
//

import SwiftUI
import APICore
import CoreEntities
import CoreUseCases

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .padding()
        .onAppear {
            let usecase = GetPopularMoviesWPaginationUseCase()
            Task {
                let model = PopularMoviesRequest(includeAdult: false, includeVideo: false, language: .us, page: 1, sort: .popularityDesc)
                let data = try? await usecase.execute(model: model)
                dump(data)
            }
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                Task {
                    let model = PopularMoviesRequest(includeAdult: false, includeVideo: false, language: .us, page: 1, sort: .popularityDesc)
                    let data = try? await usecase.execute(model: model)
                    dump(data)
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
