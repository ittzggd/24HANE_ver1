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
            HStack{
                Button{
                    selectedDay = Calendar.current.date(byAdding: .month, value: -1,  to: selectedDay)!
                } label:{
                    Image(systemName: "chevron.left")
                }
                Text(selectedDay.yearMonth)
                Button{
                    selectedDay = Calendar.current.date(byAdding: .month, value: 1,  to: selectedDay)!
                } label: {
                    Image(systemName: "chevron.right")
                }
            }
            .padding()
            VStack{
                LazyVGrid(columns: cols, spacing: 9){
                    ForEach((1...42), id: \.self){ dayNum in
                        if (dayNum > (0 + selectedDay.firstDateOfMonth) && dayNum < (selectedDay.lastDayOfMonth + selectedDay.firstDateOfMonth + 1)) {
                            Button(action: {
                                let gap = dayNum - (selectedDay.day + selectedDay.firstDateOfMonth)
                                selectedDay = Calendar.current.date(byAdding: .day, value: gap,  to: selectedDay)!
                            }) {
                                ZStack{
                                    if selectedDay.day == (dayNum - selectedDay.firstDateOfMonth) {
                                        RoundedRectangle(cornerRadius: 5)
                                           .shadow(color: .gray, radius: 1, x: -2, y: -1)
                                    } else {
                                        RoundedRectangle(cornerRadius: 5)
                                            .shadow(color: .gray, radius: 2, x: 1, y: 2)
                                    }
                                    Text("\(dayNum - selectedDay.firstDateOfMonth)")
                                        .foregroundColor(.black)
                                        .font(.system(size: 20, weight: .bold))
                                        .frame(width: 40, height: 40)
                                        .background(.white)
                                        .cornerRadius(5)
                                }
                            }
                        } else {
                            Text("")
                        }
                    }
                }
                .frame(width: 315)
            }
        }
    }
}

struct CalendarView_Previews: PreviewProvider {
    static var previews: some View {
        CalendarView(logColor: [.white, .white, .white, .gray, .white, .white, .white, .white, .white, .white, .white, .indigo, .white, .blue, .white, .white, .white, .white, .white, .white, .white, .white, .white, .indigo, .white, .white, .white, .indigo, .indigo, .blue, .white], selectedDay: .constant(Date()))
    }
}
