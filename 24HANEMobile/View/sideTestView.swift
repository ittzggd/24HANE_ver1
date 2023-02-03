//
//  sideTestView.swift
//  24HANEMobile
//
//  Created by Katherine JANG on 2/2/23.
//

import SwiftUI

extension AnyTransition {
    static var moveAndFade: AnyTransition {
        .asymmetric(insertion: .move(edge: .top).combined(with: .opacity),
                    removal: .move(edge: .trailing).combined(with: .opacity))
    }
}

struct sideTestView: View {
    @State var isSideBarVisible: Bool
    
    var sideBarWidth  = UIScreen.main.bounds.size.width * 0.6
    var bgColor: Color =
          Color(.init(
                  red: 52 / 255,
                  green: 70 / 255,
                  blue: 182 / 255,
                  alpha: 1))
    
    var body: some View {
        ZStack{
            GeometryReader { _ in
                EmptyView()
            }
            .background(.black.opacity(0.6))
            .opacity(isSideBarVisible ? 1 : 0)
            .animation(.easeInOut.delay(0.2), value: isSideBarVisible)
            .onTapGesture {
                isSideBarVisible.toggle()
            }
            content
        }
        .edgesIgnoringSafeArea(.all)
    }
    
    var content: some View {
        HStack(alignment: .top){
            Spacer()
            ZStack(alignment: .top) {
                bgColor
            }
            .frame(width: sideBarWidth)
            .offset(x: isSideBarVisible ? 0 : sideBarWidth)
            .animation(.default, value: isSideBarVisible)
        }
    }
}

struct sideTestView_Previews: PreviewProvider {
    static var previews: some View {
        sideTestView(isSideBarVisible: true)
    }
}
