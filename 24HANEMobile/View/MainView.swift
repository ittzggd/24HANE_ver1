//
//  MainView.swift
//  24HANEMobile
//
//  Created by Yunki on 2023/02/10.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        TabView {
            NavigationView {
                HomeView()
//                    .navigationTitle("HomeView")
                    .navigationBarTitleDisplayMode(.inline)
//                    .toolbar {
//                        ToolbarItem(placement: .navigationBarLeading) {
//                            Image(systemName: "house.fill")
//                        }
//                    }
                    .navigationBarHidden(true)
            }
            .border(.gray)
                .tabItem {
                    Image(systemName: "house")
                    Text("Home")
                }
            CalendarView()
                .tabItem {
                    Image(systemName: "calendar")
                }
            HamburgerView()
                .tabItem {
                    Image(systemName: "line.3.horizontal")
                }
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
