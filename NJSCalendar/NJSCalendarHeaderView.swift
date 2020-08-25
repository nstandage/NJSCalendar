//
//  NJSCalendarHeader.swift
//  Penny Wise 3
//
//  Created by Nathan on 8/12/20.
//  Copyright © 2020 Nathan. All rights reserved.
//

import SwiftUI

struct NJSCalendarHeaderView: View {
    var daysOfTheWeek = ["Sun","Mon","Tue","Wed","Thu","Fri","Sat"]
    var body: some View {
        HStack {
            ForEach(daysOfTheWeek, id:\.self) { weekday in
                Text(weekday)
                    .frame(maxWidth: .infinity)
            }
        }
        .padding(0)
    }
}
