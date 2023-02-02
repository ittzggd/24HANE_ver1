//
//  JSONs.swift
//  24HANEMobile
//
//  Created by Katherine JANG on 2/2/23.
//

import Foundation

struct mainInfo: Codable{
    let login: String
    let profileImage: String
    let isAdmin: Bool
    let inoutState: String
    let tagAt: String
    
    init(login: String, profileImage: String, isAdmin: Bool, inoutState: String, tagAt: String){
        self.login = login
        self.profileImage = profileImage
        self.isAdmin = isAdmin
        self.inoutState = inoutState
        self.tagAt = tagAt
    }
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
}

struct inOutStamp: Codable{
    let inTimeStamp: Int64
    let outTimeStamp: Int64
    let durationSecond: Int64
    
    init(inTimeStamp: Int64, outTimeStamp: Int64, durationSecond: Int64){
        self.inTimeStamp = inTimeStamp
        self.outTimeStamp = outTimeStamp
        self.durationSecond = durationSecond
    }
}
