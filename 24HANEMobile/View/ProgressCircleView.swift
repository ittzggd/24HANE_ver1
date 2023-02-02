//
//  ProgressCircleView.swift
//  24HANEMobile
//
//  Created by Katherine JANG on 2/1/23.
//

import SwiftUI

struct ProgressCircleView: View {
    var progress: Double 
    var body: some View {
        ZStack{
            Text("\(Int(progress * 100))%")
                .font(.system(size: 30, weight: .medium, design: .default))
                .foregroundColor(.indigo)
            Circle()
                .stroke(
                    Color(UIColor.systemGray3).opacity(0.5),
                    lineWidth: 13
                )
            Circle()
                .trim(from:0, to: (progress))
                .stroke(Color.gray,
                        style: StrokeStyle(
                            lineWidth: 11.5,
                            lineCap: .round))
                .rotationEffect(.degrees(270))

        }
    }
}

struct ProgressCircleView_Previews: PreviewProvider {
    static var previews: some View {
        ProgressCircleView(progress: 0.6)
    }
}
