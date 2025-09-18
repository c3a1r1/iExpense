//
//  ContentView.swift
//  iExpense
//
//  Created by Carmine on 9/4/25.
//

import SwiftUI

struct ContentView: View {
    @State private var expenses = Expenses()
    @State private var showingAddExpense = false
    
    func removeItems(at offsets: IndexSet){
        expenses.items.remove(atOffsets: offsets)
    }
    
    
    var body: some View {
        NavigationStack{
            List{
                Section("Personal"){
                    
                    ForEach(expenses.items.filter{$0.type.lowercased() == "personal"}, id: \.id){ item in
                        HStack {
                            VStack(alignment: .leading) {
                                Text(item.name)
                                    .font(.headline)
                                Text(item.type)
                            }
                            Spacer()
                            Text(item.amount, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                        }
                    }
                    .onDelete(perform: removeItems)
                }
            }
            .navigationTitle("iExpense")
            .toolbar {
                Button("Add Expense", systemImage: "plus"){
                    showingAddExpense = true
                }
                Spacer()
                EditButton()
            }
        }
        .sheet(isPresented: $showingAddExpense){
                AddView(expenses: expenses)
        }
    }
}

#Preview {
    ContentView()
}
