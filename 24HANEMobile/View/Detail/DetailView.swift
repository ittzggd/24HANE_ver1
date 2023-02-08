//
//  DetailView.swift
//  24HANEMobile
//
//  Created by Katherine JANG on 2/3/23.
//

import SwiftUI

struct DetailView: View {
    @State var selectedDay: Date
    var body: some View {
        VStack{
            CalendarView(logColor: [.white, .white, .white, .gray, .white, .white, .white, .gray, .white, .white, .white, .indigo, .indigo, .blue, .white, .white, .white, .white, .white, .white, .white, .white, .white, .indigo, .white, .white, .white, .indigo, .indigo, .blue, .white], selectedDay: $selectedDay)
            dailySumView(selectedDay: $selectedDay)
            tagLogView()
        }
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(selectedDay: Date())
    }
}
