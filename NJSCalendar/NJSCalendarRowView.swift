//
//  NJSCalendarRowView.swift
//  Penny Wise 3
//
//  Created by Nathan on 8/12/20.
//  Copyright © 2020 Nathan. All rights reserved.
//

import SwiftUI

struct NJSCalendarRowView<Cell> where Cell: NJSCalendarCellView, Cell: View {
    var cells: [Cell]
    private let columns = 7
    private let rows = 6
    private let DeviceWidth = UIScreen.main.bounds.size.width - 3
    
    var body: some View {
        HStack {
            ForEach(0..<cells.count) { i in
                cells[i]
                    .frame(maxWidth: .infinity)
                    .padding(0)
            }
        }
        .padding(0)
    }
}

extension NJSCalendarRowView: View{}
