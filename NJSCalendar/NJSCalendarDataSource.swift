//
//  Created by Nathan on 7/27/20.
//  Copyright © 2020 Nathan Standage. All rights reserved.

import Foundation





// Model - Holds data: Start date, End date, dates array
struct NJSCalendarDataSource {
    private var months: [[NJSCellData]] = []
    private var selectedMonthsIndexes: [selectedMonths] = []
    
    //MARK: - Public Facing Methods
    func getMonths() -> [[NJSCellData]] {
        return self.months
    }
    
    mutating func deselectAllCells() {
        for index in selectedMonthsIndexes {
            months[index.monthIndex][index.dayIndex].isSelected = false
        }
        selectedMonthsIndexes.removeAll()
    }
    
    mutating func select(cell: NJSCellData) {
        if cell.inMonth == false {
            return
        }
        
        for monthIndex in 0..<months.count {
            
            for dayIndex in 0..<months[monthIndex].count {
                if months[monthIndex][dayIndex] == cell && months[monthIndex][dayIndex].inMonth == true {
                    selectCellAt(monthIndex: monthIndex, dayIndex: dayIndex)
                    selectedMonthsIndexes.append(selectedMonths(monthIndex: monthIndex, dayIndex: dayIndex))
                    return
                }
            }
        }
        
    }
    
    private mutating func selectCellAt(monthIndex: Int, dayIndex: Int) {
        months[monthIndex][dayIndex].isSelected = true
    }
    
    mutating func deselect(cell: NJSCellData) {
        if cell.inMonth == false {
            return
        }
        for i in 0..<selectedMonthsIndexes.count {
            if months[selectedMonthsIndexes[i].monthIndex][selectedMonthsIndexes[i].dayIndex] == cell {
                months[selectedMonthsIndexes[i].monthIndex][selectedMonthsIndexes[i].dayIndex].isSelected = false
                selectedMonthsIndexes.remove(at: i)
                return
            }
        }
    }
    

    //MARK: - Creating CellData Methods
    private func createDatesWith(start: Date, end: Date) -> [[NJSCellData]] {
        let calendar = Calendar.current
        let numberOfMonths: Int = Calendar.current.dateComponents([.month], from: start, to: end).month!
        var months: [[NJSCellData]] = []
        
        // Get the month's weekday it starts on and number of days.
        for i in 0..<numberOfMonths {

            let monthAsDate = calendar.date(byAdding: .month, value: i, to: start)!
            let numberOfDaysInMonth = (calendar.range(of: .day, in: .month, for: monthAsDate)?.count)!
            let year = calendar.dateComponents([.year], from: monthAsDate).year!
            let month = calendar.dateComponents([.month], from: monthAsDate).month!
            var njsDates: [NJSCellData] = []
            
            for i in 0..<numberOfDaysInMonth {
                njsDates.append(NJSCellData(year: year, month: month, day: i+1, inMonth: true))
            }
            
            let firstDayOfMonth = calendar.date(bySetting: .day, value: 1, of: monthAsDate)!
            let weekdayOfFirst = calendar.dateComponents([.weekday], from: firstDayOfMonth).weekday!
            
            var daysToAdd: Int
            
            switch weekdayOfFirst {
            case 1: //sunday
                daysToAdd = 0
            case 2: //monday
                daysToAdd = 1
            case 3: //Tuesday
                daysToAdd = 2
            case 4: //Wed
                daysToAdd = 3
            case 5: //Thu
                daysToAdd = 4
            case 6: //Fri
                daysToAdd = 5
            case 7: //Sat
                daysToAdd = 6
            default:
                daysToAdd = 0
            }
            
            let previousMonth = calendar.date(byAdding: .month, value: -1, to: monthAsDate)!
            let numberOfDaysInPreviousMonth = (calendar.range(of: .day, in: .month, for: previousMonth)?.count)!
            for i in 0..<daysToAdd {
                
                let date = NJSCellData(year: calendar.component(.year, from: previousMonth), month: calendar.component(.month, from: previousMonth), day: numberOfDaysInPreviousMonth - i, inMonth: false)
                njsDates.insert(date, at: 0)
                
            }
            
            var i = 1
            while(njsDates.count < 42) {
                let nextMonth = calendar.date(byAdding: .month, value: 1, to: monthAsDate)!
                
                let nextMonthAsInt = calendar.dateComponents([.month], from: nextMonth).month!
                let nextYearAsInt = calendar.dateComponents([.year], from: nextMonth).year!
                
                njsDates.append(NJSCellData(year: nextYearAsInt, month: nextMonthAsInt, day: i, inMonth: false))
                
                i += 1
            }
            months.append(njsDates)
        }
        return months
    }
    
    
    //MARK: - Init Methods
    
    init() {
        self.months = createDatesWith(start: defaultStartDate(), end: defaultEndDate() )
    }
    
    init(startDate: Date, endDate: Date) {
        self.months = createDatesWith(start: startDate, end: endDate)
    }
    
    
    init(startDate: Date) {
        self.months = createDatesWith(start: startDate, end: defaultEndDate())
    }
    
    
    init(endDate: Date) {
        self.months = createDatesWith(start: defaultStartDate(), end: endDate)
    }
    
    
    //MARK: - Init Helper Methods
    private func defaultStartDate() -> Date {
        let dateComponents = DateComponents.init(calendar: .current, era: 1, year: 2016, month: 1, day: 1)
        return Calendar.current.date(from: dateComponents)!
    }
    
    private func defaultEndDate() -> Date {
        let today = Date()
        let monthsToAdd = 3
        var dateComponent = DateComponents()
        dateComponent.month = monthsToAdd
        guard let endDate = Calendar.current.date(byAdding: dateComponent, to: today) else {
            let components = DateComponents(calendar: .current, era: 1, year: 2022, month: 12, day: 31)
            return Calendar.current.date(from: components)!
        }
        return endDate
    }
    
    
    struct selectedMonths {
        let monthIndex: Int
        let dayIndex: Int
    }
}
