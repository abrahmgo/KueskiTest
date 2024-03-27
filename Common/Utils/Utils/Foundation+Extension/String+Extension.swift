//
//  String+Extension.swift
//  Utils
//
//  Created by Andrés Bonilla Gómez on 26/03/24.
//

import Foundation

public extension String {
    
    func toDate(formatter: DateFormat) -> Date? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = formatter.rawValue
        let date = dateFormatter.date(from: self)
        return date
    }
}
