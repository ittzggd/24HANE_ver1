//
//  24HANE.swift
//  24HANEMobile
//
//  Created by Katherine JANG on 2/2/23.
//

import Foundation

struct dailyLog {
    let inTime: String
    let outTime: String
    let logTime: String
}

class Hane: ObservableObject {
    @Published var todayAcc: Int64
    @Published var dailyAcc: Int64
    @Published var monthAcc: Int64
    @Published var logs: [dailyLog]?
    @Published var isLogin: Bool
    
    var userInfo: mainInfo?
    var monthLogs: perMonth?
    
    var calendar: [[inOutStamp]?]
    
    init(todayAcc: Int64, dailyAcc: Int64, monthAcc: Int64) {
        self.todayAcc = todayAcc
        self.dailyAcc = dailyAcc
        self.monthAcc = monthAcc
        self.isLogin = false
        self.calendar = []
    }
    
    //userInfo?.callAPI()
}
