//
//  NJSCalendarMonthView.swift
//  Penny Wise 3
//
//  Created by Nathan on 8/12/20.
//  Copyright © 2020 Nathan. All rights reserved.
//

import SwiftUI

struct NJSCalendarMonthView<Cell> where Cell: NJSCalendarCellView, Cell: View {
    let cells: [Cell]
    private let columns = 7
    private let rows = 6
    private let DeviceWidth = UIScreen.main.bounds.size.width - 3
    let weekRanges = [
        0...6,
        7...13,
        14...20,
        21...27,
        28...34,
        35...41
    ]
    
    var body: some View {
        VStack {
            ForEach(0..<weekRanges.count) { row in
                let weekSlice = cells[weekRanges[row]]
                let weekCells = Array(weekSlice)
                NJSCalendarRowView<Cell>(cells: weekCells)
                    .padding(0)
            }
        }
        .padding(0)
    }
    
}


extension NJSCalendarMonthView: View {}
