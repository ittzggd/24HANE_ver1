//
//  sideView.swift
//  24HANEMobile
//
//  Created by Katherine JANG on 2/2/23.
//

import SwiftUI

struct buttonItem: Identifiable{
    var id: Int
    var url: String
    var image: Image
    var title: String
}

var items: [buttonItem] = [
    buttonItem(id: 3001, url: "https://material-havarti-67f.notion.site/57465de14326429294859ba4a60d9c22", image: Image("notionLogo"), title: "사용가이드"),
    buttonItem(id: 3002, url: "https://spot-tomato-468.notion.site/2022-42-SEOUL-bf0513c7197f4f71b4be968b8a2cd75a", image: Image("42Logo"), title: "지원금 지침 안내"),
    buttonItem(id: 3003, url: "https://docs.google.com/forms/d/1Lqs2cOwPdPa-9crMjhATesKpslDLC5XqJ92by_Qk-Qc/edit", image: Image(systemName: "questionmark.circle"), title: "앱 문의사항"),
    buttonItem(id: 3004, url: "https://docs.google.com/forms/d/e/1FAIpQLSc_-3n_YwQsR1ZNm5DEChDTABQtw884CuI5laekfDemMmjxow/viewform", image: Image(systemName: "questionmark.circle"), title: "출입기록 문의사항")
    
]

struct sideView: View {
    
    @Binding var isSideBarOn: Bool
    var sideBarWidth  = UIScreen.main.bounds.size.width * 0.6
    
    var intraID: String
    
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
                VStack(alignment: .leading, spacing: 20){
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
                    ForEach(items) { item in
                        URLButtonView(url: item.url, Image: item.image, title: item.title)
                    }
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
        sideView(isSideBarOn: .constant(true), intraID: "hejang")
    }
}
