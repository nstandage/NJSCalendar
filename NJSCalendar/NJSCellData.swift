//
//  NJSCellData.swift
//  Penny Wise 3
//
//  Created by Nathan on 8/12/20.
//  Copyright © 2020 Nathan. All rights reserved.
//

import Foundation



struct NJSCellData: Equatable {
    
    private let date: NJSDate
    var isSelected: Bool = false
    var inMonth: Bool
    
    init(year: Int, month: Int, day: Int, isSelected: Bool = false, inMonth: Bool) {
        self.date = NJSDate(year: year, month: month, day: day)
        self.isSelected = isSelected
        self.inMonth = inMonth
    }
    
    init() {
        let date = Date()
        let year = Calendar.current.dateComponents([.year], from: date).year!
        let month = Calendar.current.dateComponents([.month], from: date).month!
        let day = Calendar.current.dateComponents([.day], from: date).day!
        
        self.date = NJSDate(year: year, month: month, day: day)
        self.inMonth = true
    }
    
    
    func year() -> Int {
        let value = Calendar.current.dateComponents([.year], from: self.date.date).year!
        return value
        
    }
    
    func month() -> Int {
        Calendar.current.dateComponents([.month], from: self.date.date).month!
    }
    
    func day() -> Int {
        Calendar.current.dateComponents([.day], from: self.date.date).day!
    }
    
    mutating func selectCell() {
        isSelected = true
    }
    
    mutating func deselectCell() {
        isSelected = false
    }
    
    
    static func ==(lhs: NJSCellData, rhs: NJSCellData) -> Bool {
        lhs.day() == rhs.day() && lhs.month() == rhs.month() && lhs.year() == rhs.year()
    }
    
    
    
//    mutating func setInMonthFor(currentMonth: Int) {
//        self.date.month == currentMonth ? self.inMonth == true : self.inMonth == false
//    }
    
}
