 //
//  ContentView.swift
//  24HANEMobile
//
//  Created by Katherine JANG on 11/29/22.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        GeometryReader { geo in
            VStack{
                CardView(times: 23456, options: [ 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18])
                    .padding()
                    .frame(width: geo.size.width, height: geo.size.height / 3.5 )
                CardView(times: 34567, options: [ 80, 90, 100, 110, 120, 130, 140, 150, 160, 170, 180, 190, 200, 210, 220, 230, 240, 250, 260, 270, 280, 290, 300, 310, 320, 330, 340])
                    .padding()
                    .frame(width: geo.size.width, height: geo.size.height / 3.5 )
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
