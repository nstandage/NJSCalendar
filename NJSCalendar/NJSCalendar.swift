//
//  NJSCalendar.swift
//  Tipsy Driver
//
//  Created by Nathan on 8/8/20.
//  Copyright © 2020 Nathan Standage. All rights reserved.
//
//ViewModel: Protocol that user implements
//Handles selection, creates and holds the model, Gives CellViews to view

import Foundation
import SwiftUI
import Combine

protocol NJSCalendar {
    var calendarDataSource: NJSCalendarDataSource { get set }
    var currentMonth: String { get set }
    var currentYear: Int { get set }
    
    func cellSelected(cellData: NJSCellData)
    func updateMonthName(index: Int)
    func updateYear(index: Int)
}






