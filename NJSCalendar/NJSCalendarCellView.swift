//
//  NJSCalendarCell.swift
//  Tipsy Driver
//
//  Created by Nathan on 8/8/20.
//  Copyright © 2020 Nathan Standage. All rights reserved.
//

import SwiftUI

protocol NJSCalendarCellView {
    var cellData: NJSCellData { get set }
    var width: CGFloat { get }
    var calendar: NJSCalendar { get }
    init(cellData: NJSCellData, calendar: NJSCalendar)
    
    // Structs must also conform to View in order to work.
}


extension NJSCalendarCellView where Self: View {}


