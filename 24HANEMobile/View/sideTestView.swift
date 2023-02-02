//
//  sideTestView.swift
//  24HANEMobile
//
//  Created by Katherine JANG on 2/2/23.
//

import SwiftUI

extension AnyTransition {
    static var moveAndFade: AnyTransition {
        .asymmetric(insertion: .move(edge: .leading).combined(with: .opacity),
                    removal: .move(edge: .trailing).combined(with: .opacity))
    }
}

struct sideTestView: View {
    
    @State var showMenu = true
    
    var body: some View {
        let drag = DragGesture()
            .onEnded {
                if $0.translation.width > 100 {
                    withAnimation{
                        showMenu.toggle()
                    }
                }
            }
        VStack{
            Button {
                withAnimation {
                    showMenu.toggle()
                }
            } label: {
                Label("test", systemImage: "popcorn")
            }
            ZStack{
                if self.showMenu {
                    sideView(intraID: "hejang") {
                        self.showMenu.toggle()
                    }
                    .transition(.moveAndFade)
                } 
                Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
            }
        }
    }
}

struct sideTestView_Previews: PreviewProvider {
    static var previews: some View {
        sideTestView()
    }
}
