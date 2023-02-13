//
//  HomeView.swift
//  24HANEMobile
//
//  Created by Yunki on 2023/02/10.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        NavigationLink(destination: CalendarView()) {
            Text("link")
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
