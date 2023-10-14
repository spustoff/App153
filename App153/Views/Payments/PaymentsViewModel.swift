//
//  PaymentsViewModel.swift
//  App153
//
//  Created by IGOR on 22/07/2023.
//

import SwiftUI

final class PaymentsViewModel: ObservableObject {
    
    @Published var operatoins: [String] = ["Income", "Expenses"]
    @Published var current_operation: String = "Income"
    
    @AppStorage("history_payments") var history_payments: [String] = []
    @Published var oper: String = ""
    @Published var operName = ""
    
    @AppStorage("income") var income: Int = 0
    @AppStorage("expenses") var expenses: Int = 0


}
