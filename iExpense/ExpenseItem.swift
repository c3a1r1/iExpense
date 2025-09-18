//
//  ExpenseItem.swift
//  iExpense
//
//  Created by Carmine on 9/12/25.
//

import Foundation

struct ExpenseItem: Identifiable, Codable{
    var id = UUID()
    let name: String
    let type: String
    let amount: Double
}
