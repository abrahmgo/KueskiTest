//
//  StyleText.swift
//  UI
//
//  Created by Andrés Bonilla Gómez on 26/03/24.
//

import SwiftUI

public protocol TextViewStyleType {
    var font: Font { get }
    var alignment: Alignment { get }
}

public enum TextStyle: TextViewStyleType {

    case title
    case headline
    case body
    
    public var font: Font {
        switch self {
        case .title:
            return .largeTitle
        case .headline:
            return .headline
        case .body:
            return .body
        }
    }
    
    public var alignment: Alignment {
        switch self {
        case .title:
            return .center
        case .headline:
            return .leading
        case .body:
            return .leading
        }
    }
}
