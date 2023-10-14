//
//  StatisticsViewModel.swift
//  App153
//
//  Created by IGOR on 20/07/2023.
//

import SwiftUI

final class StatisticsViewModel: ObservableObject {
    
    @Published var pairs: [String] = ["USDEUR", "AUDCAD", "CHFJPY", "CHFNZD"]
    @Published var current_pair: String = "USDEUR"
    
    @Published var intervals: [String] = ["60", "80", "90", "110", "120", "130", "140"]
    @Published var current_interval: String = "60"
    
    @AppStorage("income") var income: Int = 0
    @AppStorage("expenses") var expenses: Int = 0
    @AppStorage("carAmount") var carAmount: Int = 0
    @AppStorage("balance") var balance = 5000
    
    @Published var isMenu: Bool = false
}
