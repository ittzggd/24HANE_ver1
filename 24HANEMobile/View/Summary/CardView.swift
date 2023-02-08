//
//  CardView.swift
//  24HANEMobile
//
//  Created by Katherine JANG on 2/1/23.
//

import SwiftUI

func timeToString(time: Int64) -> String {
    let hours = time / 3600
    let min = time % 3600 / 60
    let accumulationTime = "\(hours) : \(min) "
    return accumulationTime
}

func getProgress(current: Int64, goal: Int) -> Double {
    var progress : Double
    progress = (Double(current) / 3600) / Double(goal)
    if progress >= 1 {
        progress = 1
    }
    return progress
}


struct CardView: View {
    @Environment(\.colorScheme) var colorScheme
    
    var times: Int64
    var options: Array<Int>
    @State var selectedOption = 0
    
   
    var body: some View {
            ZStack(alignment: .center){
                RoundedRectangle(cornerRadius: 20)
                    .foregroundColor(colorScheme == .light ? .cardBackground : .white)
                    .shadow(color: .gray, radius: 2, x: 3, y: 3)

                HStack(alignment: .center) {
                    VStack(alignment: .center, spacing: 0){
                        Text("누적시간")
                            .font(.system(size: 17, weight: .regular, design: .rounded))
                            .foregroundColor(.black)
                            .padding(.top, 3)
                        Text("\(timeToString(time: times))")
                            .font(.system(size: 30, weight: .medium, design: .default))
                            .fixedSize(horizontal: true, vertical: false)
                            .padding()
                        Text("목표시간")
                            .font(.system(size: 17, weight: .regular, design: .rounded))
                            .foregroundColor(.black)
                            .padding(.top, 4)
                        HStack{
                            Menu{
                                Picker(selection: $selectedOption){
                                    ForEach(0 ..< options.count, id: \.self) { times in
                                        Text("\(Int(options[times])) 시간")
                                    }
                                } label: {}
                            } label:{
                                Text(" \(options[selectedOption]) h")
                                    .font(.system(size: 30, weight: .medium, design: .default))
                                    .foregroundColor(.black)
                                    .fixedSize(horizontal: true, vertical: false)
                            }
                            Image(systemName: "chevron.up.chevron.down")
                                .resizable()
                                .frame(width: 9, height:11)
                                .foregroundColor(.gray)
                        }
                        .padding()
                    }
                    Spacer()
                    Divider()
                        .frame(height: 60)
                        .background(Color.black)
                    Spacer()
                    ProgressCircleView(progress: getProgress(current: times, goal: options[selectedOption]))
                        .frame(width: 150, height: 180)
                }
                .padding()

            }
    }
}

struct CardView_Previews: PreviewProvider {
    
    static var previews: some View {
        CardView(times : 12345, options: [ 80, 90, 100, 110, 120, 130, 140, 150, 160, 170, 180, 190, 200, 210, 220, 230, 240, 250, 260, 270, 280, 290, 300, 310, 320, 330, 340])
    }
}
