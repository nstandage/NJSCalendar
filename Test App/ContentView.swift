//
//  ContentView.swift
//  NJSCalendar
//
//  Created by Nathan on 8/25/20.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var calendar = TestCalendar()
    
    var body: some View {
        VStack {
            HStack  {
                Text(self.calendar.currentMonth)
                Text(String(self.calendar.currentYear))
            }
            .font(.largeTitle)
            .padding()
            
            NJSCalendarScrollView<TestCell>(cells: self.calendar.createCellViews(), calendar: calendar)
            Spacer()
        }
        
        
    }
}


