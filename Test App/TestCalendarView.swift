//
//  TEST-CalendarView.swift
//  Penny Wise 3
//
//  Created by Nathan on 8/12/20.
//  Copyright © 2020 Nathan. All rights reserved.
//

import SwiftUI
import Combine

//@main
struct TestCalendarView: View {
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
