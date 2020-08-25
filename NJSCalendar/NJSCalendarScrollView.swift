//
//  NJSCalendarGridView.swift
//  Penny Wise 3
//
//  Created by Nathan on 8/12/20.
//  Copyright © 2020 Nathan. All rights reserved.
//

import SwiftUI

struct NJSCalendarScrollView<Cell> where Cell: NJSCalendarCellView, Cell: View {
    private var cells: [[Cell]]
    private var calendar: NJSCalendar
    private let height = UIScreen.main.bounds.width - 100
//    private let height = UIScreen.main.nativeBounds.width
    
    @State private var currentTab = 0
    
    var body: some View {
        return VStack {
            NJSCalendarHeaderView()
            ScrollView(.horizontal, showsIndicators: false) {
                LazyHStack {
                    TabView(selection: $currentTab) {
                        ForEach(0..<cells.count) { i in
                            NJSCalendarMonthView(cells: cells[i])
                        }
                    }
                    .frame(width: UIScreen.main.bounds.width, height: height)
                    .padding(0)
                    .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
                }
                .padding(0)
                Spacer()
            }
            .frame(width: UIScreen.main.bounds.width, height: height)
            .padding(0)
            .onChange(of: currentTab) { _ in
                calendar.updateMonthName(index: currentTab)
                calendar.updateYear(index: currentTab)
            }
            .onAppear() {
                calendar.updateMonthName(index: currentTab)
                calendar.updateYear(index: currentTab)
            }
            Spacer()
            
        }
        .padding(0)
    }
    init(cells: [[Cell]], calendar: NJSCalendar, scrollToCurrentMonth: Bool = true) {
        self.cells = cells
        self.calendar = calendar
        
        if scrollToCurrentMonth == true {
            let scrollMonth = setCurrentMonthScroll(calendar: calendar)
            self._currentTab = State(initialValue: scrollMonth)
        }
    }
    
    
    func setCurrentMonthScroll(calendar: NJSCalendar) -> Int {
        var currentMonth = 0
        let today = NJSDate()
        
        for monthIndex in 0..<calendar.calendarDataSource.getMonths().count {
            for day in calendar.calendarDataSource.getMonths()[monthIndex] {
                if today.year == day.year() && today.month == day.month() && today.day == day.day() {
                    currentMonth = monthIndex
                    break
                }
            }
        }
        return currentMonth
    }
    
}

extension NJSCalendarScrollView: View {}

