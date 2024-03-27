//
//  RateStyle.swift
//  UI
//
//  Created by Andrés Bonilla Gómez on 27/03/24.
//

import SwiftUI

public protocol RateViewStyleType {
    var background: Color { get }
    var stroke: Color { get }
}

public enum RateStyle: RateViewStyleType {
    
    case bad
    case medium
    case almost
    case perfect
    
    public var stroke: Color {
        switch self {
        case .bad:
            return .red
        case .medium:
            return .yellow
        case .almost:
            return .cyan
        case .perfect:
            return .green
        }
    }
    
    public var background: Color {
        return .gray
    }
    
    
    public init?(rate: Double) {
        switch rate {
        case 0..<25:
            self = .bad
        case 26..<50:
            self = .medium
        case 51..<75:
            self = .almost
        default:
            self = .perfect
        }
    }
}
