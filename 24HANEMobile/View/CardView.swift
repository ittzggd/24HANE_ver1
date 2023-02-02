//
//  CardView.swift
//  24HANEMobile
//
//  Created by Katherine JANG on 2/1/23.
//

import SwiftUI



struct CardView: View {
    @Environment(\.colorScheme) var colorScheme
    
    var options: Array<Int>
    @State var selectedOption = 0
    
   
    var body: some View {
        ZStack(alignment: .center){
            GeometryReader{ geo in
                RoundedRectangle(cornerRadius: 20)
                    .frame(width: geo.size.width, height: geo.size.height / 3.5 )
                    .foregroundColor(colorScheme == .light ? .cardBackground : .white)
                HStack{
                    VStack(alignment: .center){
                        Text("누적시간         ")
                            .font(.system(size: 17, weight: .regular, design: .rounded))
                            .foregroundColor(.black)
                            .padding(2)
                        Text("2 H 20 M   ")
                            .font(.system(size: 30, weight: .medium, design: .default))
                            .fixedSize(horizontal: true, vertical: false)
                            .padding(.bottom)
                        Text("목표시간        ")
                            .font(.system(size: 17, weight: .regular, design: .rounded))
                            .foregroundColor(.black)
                        HStack{
                            Menu{
                                Picker(selection: $selectedOption){
                                    ForEach(0 ..< options.count, id: \.self) { times in
                                        Text("\(Int(options[times])) 시간")
                                    }
                                } label: {}
                            } label:{
                                Text("\(options[14]) Hours")
                                    .font(.system(size: 30, weight: .medium, design: .default))
                                    .foregroundColor(.black)
                                    .fixedSize(horizontal: true, vertical: false)
                            }
                            Image(systemName: "chevron.up.chevron.down")
                                .resizable()
                                .frame(width: 9, height:11)
                                .foregroundColor(.gray)
                        }
                    }
                    Divider()
                        .frame(height: 60)
                        .background(Color.black)
                    ProgressCircleView(progress: 0.6)
                }
                .padding()

            }
        }
    }
}

struct CardView_Previews: PreviewProvider {
    
    static var previews: some View {
        CardView(options: [ 80, 90, 100, 110, 120, 130, 140, 150, 160, 170, 180, 190, 200, 210, 220, 230, 240, 250, 260, 270, 280, 290, 300, 310, 320, 330, 340])
    }
}
