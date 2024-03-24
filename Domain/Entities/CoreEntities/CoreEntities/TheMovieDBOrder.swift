//
//  TheMovieDBOrder.swift
//  CoreEntities
//
//  Created by Andrés Bonilla Gómez on 23/03/24.
//

import Foundation

public enum MoviesOrder {
    case popular(order: MoviesSort)
    case playing(order: MoviesSort)
}

public enum MoviesSort {
    case date
    case name
}

public enum ContentOrder {
    case list
    case grid
}
