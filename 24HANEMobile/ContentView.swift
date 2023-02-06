 //
//  ContentView.swift
//  24HANEMobile
//
//  Created by Katherine JANG on 11/29/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
       MainView(isSideBarOn: false)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(Hane())
    }
}
