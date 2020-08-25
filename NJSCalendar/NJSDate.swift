//
//  NJSMonth+Date.swift
//  Tipsy Driver
//
//  Created by Nathan on 8/8/20.
//  Copyright © 2020 Nathan Standage. All rights reserved.
//

import Foundation


struct NJSDate {
    let date: Date
    
    init(year: Int, month: Int, day: Int) {
        var components = DateComponents()
        components.year = year
        components.month = month
        components.day = day
        
        if let newDate = Calendar.current.date(from: components) {
            self.date = newDate
        } else {
            self.date = Date()
        }
    }
    
    init() {
        self.date = Date()
    }
    
    var year: Int {
        Calendar.current.dateComponents([.year], from: self.date).year!
    }
    
    var month: Int {
        Calendar.current.dateComponents([.month], from: self.date).month!
    }
    
    var day: Int {
        Calendar.current.dateComponents([.day], from: self.date).day!
    }

}
