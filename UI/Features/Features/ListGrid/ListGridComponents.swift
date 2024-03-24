//
//  ListGridComponents.swift
//  Features
//
//  Created by Andrés Bonilla Gómez on 23/03/24.
//

import UI

public enum ListGridComponents: Identifiable {
    
    public var id: String {
        return UUID().uuidString
    }
    
    case image(viewData: ImageViewDataType)
}

extension ListGridComponents {
    
    static func == (lhs: ListGridComponents, rhs: ListGridComponents) -> Bool {
        return lhs.id == rhs.id
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(self.id)
    }
}

