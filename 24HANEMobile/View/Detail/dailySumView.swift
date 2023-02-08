//
//  dailySumView.swift
//  24HANEMobile
//
//  Created by Katherine JANG on 2/7/23.
//

import SwiftUI

struct dailySumView: View {
    
    @Binding var selectedDay: Date
    
    var body: some View {
        HStack{
            VStack{
               Text("daily")
            }
            .padding()
            VStack{
                Text("daily")
            }
            .padding()
        }
    }
}

struct dailySumView_Previews: PreviewProvider {
    static var previews: some View {
        dailySumView(selectedDay: .constant(Date()))
    }
}
