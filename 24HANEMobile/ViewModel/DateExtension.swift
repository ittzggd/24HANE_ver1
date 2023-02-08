//
//  DateExtension.swift
//  24HANEMobile
//
//  Created by Katherine JANG on 2/3/23.
//

import Foundation

extension Date {
    var millisecondsSince1970: Int64 {
        Int64((self.timeIntervalSince1970 * 1000.0).rounded())
    }
    
    init(milliseconds: Int64) {
        self = Date(timeIntervalSince1970: TimeInterval(milliseconds))
    }
}

extension Date {
    var year: Int{
        let cal = Calendar.current
        return cal.component(.year, from: self)
    }
    var month: Int {
        let cal = Calendar.current
        return cal.component(.month, from: self)
    }
    var day: Int {
        let cal = Calendar.current
        return cal.component(.day, from: self)
    }

    public var yearName: String{
        let nameFormatter = DateFormatter()
        nameFormatter.dateFormat = "YYYY"
        return nameFormatter.string(from: self)
    }
    
    public var monthName: String{
        let nameFormatter = DateFormatter()
        nameFormatter.dateFormat = "MMM"
        return nameFormatter.string(from: self)
    }
    
    public var fullDate: String{
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "YYYY MM dd"
        return dateFormatter.string(from: self)
    }
    
    public var yearMonth: String{
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "YYYY.MM"
        return dateFormatter.string(from: self)
    }
}

extension Date{
    var firstDateOfMonth: Int {
        let cal = Calendar.current
        let dateComponents = DateComponents(year: self.year, month: self.month)
        let startOfMonth = cal.date(from:dateComponents)
        let component = cal.dateComponents([.day, .weekday, .weekOfMonth], from: startOfMonth!)
        
        if let weekday = component.weekday{
            return(weekday - 1)
        }
        return 0
    }
    
    var lastDayOfMonth: Int {
        let cal = Calendar.current
        let dateComponents = DateComponents(year: self.year, month: self.month)
        let startOfMonth = cal.date(from: dateComponents)
        let nextMonth = cal.date(byAdding: .month, value:+1, to: startOfMonth!)
        let endOfMonth = cal.date(byAdding: .day, value: -1,  to: nextMonth!)
        let comp2 = cal.dateComponents([.day, .weekday, .weekOfMonth], from: endOfMonth!)
        
        return comp2.day!
    }
}

extension Int{
    var seconds: Int{
        return self
    }
    var minutes: Int {
        return self.seconds * 60
     }

     var hours: Int {
        return self.minutes * 60
     }

     var days: Int {
        return self.hours * 24
     }
}
