//
//  ListGridRouter.swift
//  Features
//
//  Created by Andrés Bonilla Gómez on 25/03/24.
//

import SwiftUI

public final class Router<T: Hashable>: ObservableObject {
    
    public init(paths: [T] = []) {
        self.paths = paths
    }
    
    @Published public var paths: [T]
    public func push(_ path: T) {
        paths.append(path)
    }
}

public enum ListGridPath: Hashable {
    case item(index: Int)
}
