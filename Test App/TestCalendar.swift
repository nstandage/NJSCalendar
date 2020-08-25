//
//  TEST-View_Model.swift
//  Penny Wise 3
//
//  Created by Nathan on 8/12/20.
//  Copyright © 2020 Nathan. All rights reserved.
//

import Foundation
import SwiftUI
import Combine

// DELETE
class TestCalendar: NJSCalendar, ObservableObject {
    
    
    @Published var calendarDataSource: NJSCalendarDataSource = NJSCalendarDataSource()
    @Published var currentMonth: String = ""
    @Published var currentYear: Int = 0
    
    
    func updateYear(index: Int) {
        self.currentYear = self.calendarDataSource.getMonths()[index][10].year()
    }

    func updateMonthName(index: Int) {
        let month = self.calendarDataSource.getMonths()[index][10].month()
        var monthName = ""
        
        switch month {
        case 1:
            monthName = "January"
        case 2:
            monthName = "February"
        case 3:
            monthName = "March"
        case 4:
            monthName = "April"
        case 5:
            monthName = "May"
        case 6:
            monthName = "June"
        case 7:
            monthName = "July"
        case 8:
            monthName = "August"
        case 9:
            monthName = "September"
        case 10:
            monthName = "October"
        case 11:
            monthName = "November"
        case 12:
            monthName = "December"
        default:
            monthName = "January"
        }
        
        self.currentMonth = monthName
    }
    
    func cellSelected(cellData: NJSCellData) {
        
        if cellData.isSelected == true {
            self.calendarDataSource.deselect(cell: cellData)
        } else {
            self.calendarDataSource.select(cell: cellData)
        }
    }

    func createCellViews() -> [[TestCell]] {
        var monthViews: [[TestCell]] = []
        
        for monthIndex in 0..<self.calendarDataSource.getMonths().count {
            var currentMonth: [TestCell] = []
            for dayIndex in 0..<self.calendarDataSource.getMonths()[monthIndex].count {
                currentMonth.append(TestCell(cellData: self.calendarDataSource.getMonths()[monthIndex][dayIndex], calendar: self))
            }
            monthViews.append(currentMonth)
        }
        return monthViews
    }
}
