//
//  MainView.swift
//  24HANEMobile
//
//  Created by Katherine JANG on 2/3/23.
//

import SwiftUI

struct MainView: View {
    
    @Environment(\.colorScheme) var colorScheme
    @State var isSideBarOn: Bool
    
    var body: some View {
        ZStack{
            VStack(){
                HeaderView(isSideBarOn: $isSideBarOn)
                SummaryView()
                    .padding()
            }
            sideView(isSideBarOn: $isSideBarOn, intraID: "hejang")
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView(isSideBarOn: false)
    }
}
