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
    @Published var calendar: [[dailyLog]]
    @Published var date = Date()
    
    var accTime: accumationTimes?
    var userInfo: mainInfo?
    var monthLogs: perMonth?
    
    
    init(todayAcc: Int64, dailyAcc: Int64, monthAcc: Int64) {
        self.todayAcc = todayAcc
        self.dailyAcc = dailyAcc
        self.monthAcc = monthAcc
        self.isLogin = false
        self.calendar = []
    }
    
    @MainActor
    func APIHandler() async throws {
        var components = URLComponents(string: "https://api.24hoursarenotenough.42seoul.kr/v1/tag-log/permonth")!
        let year = URLQueryItem(name: "year", value: "\(date.year)") // date.year
        let month = URLQueryItem(name: "month", value: "\(date.month)") //date.month
        components.queryItems = [year, month]
        
        userInfo =  try await getJsonAsync("https://api.24hoursarenotenough.42seoul.kr/v1/tag-log/maininfo", type: mainInfo.self)
        accTime = try await getJsonAsync("https://api.24hoursarenotenough.42seoul.kr/v1/tag-log/accumulationTimes", type: accumationTimes.self)
        monthLogs = try await getJsonAsync(components.url!.absoluteString, type: perMonth.self)
        
    }
    
    func Formatting(){
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "YYYY-M-d"
        
    }
    
    @MainActor
    func LoadData(){
        
    }
    
    
    private func getJsonAsync<T>(_ url: String, type: T.Type) async throws -> T where T : Decodable {
        guard let url = URL(string: url) else {
            fatalError("MissingURL")
        }
        guard let token = UserDefaults.standard.string(forKey: "Token") else {
            fatalError("UnValid Token")
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = [
            "Authorization" : "Bearer \(String(describing: token) )"
        ]
        let (data, response) = try await URLSession.shared.data(for: request)
        guard (response as? HTTPURLResponse)?.statusCode == 200 else {
            fatalError("Access Denied")
            /*
              [FixMe] => Back to signIn Logic
             */
        }
        let decodedData =  try JSONDecoder().decode(type.self, from: data)
        return decodedData
    }
}
