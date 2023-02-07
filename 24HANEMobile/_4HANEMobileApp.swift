//
//  _4HANEMobileApp.swift
//  24HANEMobile
//
//  Created by Katherine JANG on 11/29/22.
//

import SwiftUI


@main
struct _4HANEMobileApp: App {
    var hane: Hane = Hane()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(hane)
        }
    }
}
