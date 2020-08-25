//
//  TEST-CalendarCell.swift
//  Penny Wise 3
//
//  Created by Nathan on 8/12/20.
//  Copyright © 2020 Nathan. All rights reserved.
//

import SwiftUI

//DELETE
struct TestCell: NJSCalendarCellView, View {
    var calendar: NJSCalendar
    var cellData: NJSCellData
    var cellColor = Color.black
    var width = UIScreen.main.bounds.size.width / 8
    var body: some View {
        return Group {
            Text("\(cellData.day())")
                .foregroundColor(cellColor)
                .fontWeight(cellData.isSelected == false ? .light : .bold)
                .frame(width: width, height: width)
                .onTapGesture {
                    calendar.cellSelected(cellData: cellData)
                }
        }
    }
    
    init(cellData: NJSCellData, calendar: NJSCalendar) {
        self.cellData = cellData
        self.calendar = calendar
        
        if cellData.inMonth {
            if cellData.isSelected {
                cellColor = Color.red
            } else {
                cellColor = Color.black
            }
        } else  {
            cellColor = Color.gray
        }
    }
}


//extension TestCell: NJSCalendarCellView, View {}
