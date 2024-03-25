//
//  MoviewComponents.swift
//  TheMoviewDB
//
//  Created by Andrés Bonilla Gómez on 25/03/24.
//

import UI

enum MovieComponents: Identifiable {
    
    var id: String {
        return UUID().uuidString
    }
    
    case image(viewData: ImageViewDataType)
    case text(viewData: TextViewDataType)
}

extension MovieComponents {
    
    static func == (lhs: MovieComponents, rhs: MovieComponents) -> Bool {
        return lhs.id == rhs.id
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(self.id)
    }
}

