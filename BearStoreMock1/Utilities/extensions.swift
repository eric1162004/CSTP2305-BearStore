//
//  FloatExtension.swift
//  BearStoreMock1
//
//  Created by eric on 2022-04-01.
//

import Foundation

extension Float {
    
    func toStringWithDecimal(n: Int) ->  String {
        String(format: "%.\(n)f", self)
    }
    
}

extension String {
    var floatValue: Float {
        return (self as NSString).floatValue
    }
}

extension Date {
    
    func dateToString(_ format: String = "MMM dd yyy") -> String {
        return self.formatToString(format)
    }
        
    func dateToMonthYearString() -> String {
        return self.formatToString("MMM yyy")
    }
    
    private func formatToString(_ format: String) -> String{
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        return dateFormatter.string(from: self)
    }
    
    func isInMonthYear(monthYearString: String) -> Bool {
        return self.dateToMonthYearString() == monthYearString
    }
    
    static func stringToDate(_ dateString: String, _ format: String = "MMM dd yyy") -> Date? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        return dateFormatter.date(from: dateString)
    }
    
}
