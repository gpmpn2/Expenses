//
//  Expense.swift
//  Expenses
//
//  Created by Grant Maloney on 8/23/18.
//  Copyright © 2018 Grant Maloney. All rights reserved.
//

import Foundation

class Expense {
    var title:String
    var amount:Double
    var date:Date
    
    init(title:String, amount:Double, date:Date) {
        self.title = title
        self.amount = amount
        self.date = date
    }
}
