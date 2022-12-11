//
//  NetworkManager.swift
//  24HANEMobile
//
//  Created by Katherine JANG on 12/7/22.
//

import Foundation
import Network

class NetworkManager: ObservableObject{
    let monitor = NWPathMonitor()
    let queue = DispatchQueue(label: "NetworkMonitor")
    
    @Published var isConnected = true
    @Published var showAlert = false
    
    init() {
        monitor.pathUpdateHandler = { path in
            DispatchQueue.main.async {
                self.isConnected =  path.status == .satisfied
                self.showAlert = !self.isConnected
            }
        }
        monitor.start(queue: queue)
    }
    
    func monitoringNetwork(completionHandler: @escaping(Bool) -> Void) {
        monitor.pathUpdateHandler = { path in
            DispatchQueue.main.async {
                self.isConnected =  path.status == .satisfied
                self.showAlert = !self.isConnected
                completionHandler(self.isConnected)
            }
        }
        monitor.start(queue: queue)
    }
}
