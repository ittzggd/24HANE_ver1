//
//  _4HANEMobileApp.swift
//  24HANEMobile
//
//  Created by Katherine JANG on 11/29/22.
//

import SwiftUI


@main
struct _4HANEMobileApp: App {
    
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    
    var isSigned = IsSignedIn()
    var apiHandler = APIHandler()
    var body: some Scene {
        WindowGroup {
            MainView()
//            ContentView(isSignedIn: IsSignedIn())
//                .environmentObject(isSigned)
//                .environmentObject(apiHandler)
//                .onAppear{
//                    print("hi")
//                }
        }
    }
}
