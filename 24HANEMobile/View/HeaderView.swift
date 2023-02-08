//
//  HeaderView.swift
//  24HANEMobile
//
//  Created by Yunki on 2023/02/03.
//

import SwiftUI

struct HeaderView: View {
    @Environment(\.refresh) private var refresh
    @Environment(\.colorScheme) var colorScheme
    @Binding var isSideBarOn: Bool
    @State private var isLoading = false
    
    var body: some View {
        HStack {
            Image("24HaneLogo")
                .resizable()
                .frame(width: 35, height: 35)
                .padding()
            Spacer()
            //            if let refresh = refresh {
            if isLoading {
                VStack(alignment: .leading){
                    ProgressView()
                        .frame(width: 27, height: 27)
                }
            } else {
                Button(){
                    isLoading = true
                    //                        Task{
                    //                            await refresh()
                    //                            isLoading = false
                    //                        }
                } label:{
                    Image(systemName: "goforward")
                        .resizable()
                        .frame(width: 27, height: 27)
                        .foregroundColor(colorScheme == .light ? .black : .white)
                        .rotationEffect(.degrees(90))
                }
            }
            //            }
            Button{
                self.isSideBarOn.toggle()
            } label:{
                Image(systemName: "line.3.horizontal")
                    .resizable()
                    .frame(width: 25, height: 20)
                    .foregroundColor(colorScheme == .light ? .black : .white)
            } .padding()
        }
    }
}

struct HeaderView_Previews: PreviewProvider {
    static var previews: some View {
        HeaderView(isSideBarOn: .constant(false))
    }
}
