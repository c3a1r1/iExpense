//
//  Expenses.swift
//  iExpense
//
//  Created by Carmine on 9/12/25.
//

import Foundation

@Observable
class Expenses{
    var items = [ExpenseItem](){
        didSet{
            if let encoder = try? JSONEncoder().encode(items){
                UserDefaults.standard.set(encoder, forKey: "Items")
            }
        }
    }
    
    init(){
        if let savedItems = UserDefaults.standard.data(forKey: "Items"){
            if let decodedItems = try? JSONDecoder().decode([ExpenseItem].self, from: savedItems){
                items = decodedItems
                return
            }
        }
        
        items = []            
    }
}
