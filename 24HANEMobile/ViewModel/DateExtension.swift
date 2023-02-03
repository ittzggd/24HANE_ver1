//
//  DateExtension.swift
//  24HANEMobile
//
//  Created by Katherine JANG on 2/3/23.
//

import Foundation

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
