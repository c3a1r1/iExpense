//
//  SecondView.swift
//  iExpense
//
//  Created by Carmine on 9/6/25.
//

import SwiftUI

struct SecondView: View {
    @Environment(\.dismiss) var dismiss
    let name: String
    var body: some View {
        Button("Dismiss"){
            dismiss()
        }
    }
}

#Preview {
    SecondView(name: "Carmine")
}
