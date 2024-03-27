//
//  Date+Extension.swift
//  Utils
//
//  Created by Andrés Bonilla Gómez on 26/03/24.
//

import Foundation

public enum DateFormat: String {
    
    case completeYearMonthDaySlash = "dd/MM/yyyy"
    case yearMonthDaySlash = "YY/MM/dd"
    case dayMonthYearComa = "d MMM yyyy"
    case fullMiddleDash = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
    case monthYear = "MMM yyyy"
    case middleDash = "yyyy-MM-dd"
}

public extension Date {
    
    func toSring(format: DateFormat) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format.rawValue
        dateFormatter.locale = .current
        let stringDate = dateFormatter.string(from: self)
        return stringDate
    }
}
