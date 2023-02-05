//
//  CalendarView.swift
//  24HANEMobile
//
//  Created by Katherine JANG on 2/5/23.
//

import SwiftUI

struct CalendarView: View {
    var cols: [GridItem] = [
        GridItem(.flexible(), spacing: 10),
        GridItem(.flexible(), spacing: 10),
        GridItem(.flexible(), spacing: 10),
        GridItem(.flexible(), spacing: 10),
        GridItem(.flexible(), spacing: 10),
        GridItem(.flexible(), spacing: 10),
        GridItem(.flexible(), spacing: 10)
    ]
    var logColor: Array<Color>
    @Binding var selectedDay: Date
    var body: some View {
        VStack{
            LazyVGrid(columns: cols, spacing: 8){
                ForEach((1...42), id: \.self){ dayNum in
                    
                }
            }
        }
    }
}

struct CalendarView_Previews: PreviewProvider {
    static var previews: some View {
        CalendarView(logColor: [.white, .white, .white, .gray, .white, .white, .white, .gray, .white, .white, .white, .indigo, .indigo, .blue, .white, .white, .white, .white, .white, .white, .white, .white, .white, .indigo, .white, .white, .white, .indigo, .indigo, .blue, .white], selectedDay: .constant(Date()))
    }
}
