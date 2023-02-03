//
//  sideView.swift
//  24HANEMobile
//
//  Created by Katherine JANG on 2/2/23.
//

import SwiftUI


struct sideView: View {
    
    @State var isSideBarOn: Bool
    var sideBarWidth  = UIScreen.main.bounds.size.width * 0.6
    
    var intraID: String
  //  let menuToggle: () -> Void
    
    var body: some View {
        ZStack{
            GeometryReader { _ in
                EmptyView()
            }
            .background(.black.opacity(0.6))
            .opacity(isSideBarOn ? 1 : 0)
            .animation(.easeInOut.delay(0.2), value: isSideBarOn)
            .onTapGesture {
                isSideBarOn.toggle()
            }
            content
        }
        .edgesIgnoringSafeArea(.all)
    }
   
    var content: some View {
        HStack(alignment: .top){
            Spacer()
            ZStack(alignment: .top){
                Color.white
                VStack(alignment: .leading){
                    HStack {
                        Image("42Logo")
                            .resizable()
                            .frame(width: 40, height: 50)
                        Text(" \(intraID)")
                            .font(.system(size: 25, weight: .medium, design: .default))
                            .foregroundColor(.black)
                            .font(.headline)
                        Spacer()
                    }
                    .padding(.top, 100)
                    URLButtonView(url: "https://material-havarti-67f.notion.site/57465de14326429294859ba4a60d9c22", Image: Image("notionLogo"), title: "사용 가이드")
                        .padding(.top, 30)
                    URLButtonView(url: "https://spot-tomato-468.notion.site/2022-42-SEOUL-bf0513c7197f4f71b4be968b8a2cd75a", Image: Image("42Logo"), title: "지원금 지침 안내")
                        .padding(.top, 10)
                    URLButtonView(url: "https://docs.google.com/forms/d/1Lqs2cOwPdPa-9crMjhATesKpslDLC5XqJ92by_Qk-Qc/edit", Image: Image(systemName: "questionmark.circle"), title: "앱 문의사항")
                        .padding(.top, 10)
                    URLButtonView(url: "https://docs.google.com/forms/d/e/1FAIpQLSc_-3n_YwQsR1ZNm5DEChDTABQtw884CuI5laekfDemMmjxow/viewform", Image: Image(systemName: "questionmark.circle"), title: "출입기록 문의사항")
                        .padding(.top, 10)
                    Spacer()
                    URLButtonView(url: "https://profile.intra.42.fr/legal/terms", Image: Image(systemName: "lock.doc.fill"), title: "서비스이용약관")
                        .padding(.bottom, 30)
                }
                .padding()
            }
            .frame(width: sideBarWidth)
            .offset(x: isSideBarOn ? 0 : sideBarWidth)
            .animation(.default, value: isSideBarOn)
        }
    }
}

struct sideView_Previews: PreviewProvider {
    static var previews: some View {
        sideView(isSideBarOn: true, intraID: "hejang")
    }
}
