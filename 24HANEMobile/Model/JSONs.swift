//
//  JSONs.swift
//  24HANEMobile
//
//  Created by Yunki on 2023/02/02.
//

import Foundation

struct mainInfo: Codable{
    let login: String
    let profileImage: String
    let isAdmin: Bool
    let inoutState: String
    
    init(login: String, profileImage: String, isAdmin: Bool, inoutState: String){
        self.login = login
        self.profileImage = profileImage
        self.isAdmin = isAdmin
        self.inoutState = inoutState
    }
    static let sample = mainInfo.init(login: "", profileImage: "", isAdmin: false, inoutState: "")
}

struct perMonth: Codable {
    let login: String
    let profileImage: String
    let inOutLogs: [inOutStamp]
    
    init(login: String, profileImage: String, inOutLogs: [inOutStamp]) {
        self.login = login
        self.profileImage = profileImage
        self.inOutLogs = inOutLogs
    }
    static let sample = perMonth.init(login: "", profileImage: "", inOutLogs: [])
}

struct inOutStamp: Codable{
    let inTimeStamp: Int64?
    let outTimeStamp: Int64?
    let durationSecond: Int64?
    
    init(inTimeStamp: Int64, outTimeStamp: Int64, durationSecond: Int64){
        self.inTimeStamp = inTimeStamp
        self.outTimeStamp = outTimeStamp
        self.durationSecond = durationSecond
    }
    static let sample = inOutStamp.init(inTimeStamp: -1, outTimeStamp: -1, durationSecond: -1)
}
