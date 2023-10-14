//
//  AddPayment.swift
//  App153
//
//  Created by IGOR on 22/07/2023.
//

import SwiftUI

struct AddPayment: View {
    
    @StateObject var viewModel = PaymentsViewModel()
    
    @Environment(\.presentationMode) var router
    
    var body: some View {
        
        ZStack {
            
            Color("bg")
                .ignoresSafeArea()
            
            VStack {
                
                
                Button(action: {
                    
                    router.wrappedValue.dismiss()
                    
                }, label: {
                    
                    HStack {
                        
                        Image(systemName: "chevron.left")
                            .foregroundColor(Color("gr"))
                            .font(.system(size: 15, weight: .regular))
                        
                        Text("Back")
                            .foregroundColor(Color("gr"))
                            .font(.system(size: 15, weight: .regular))
                        
                        
                    }
                })
                .frame(maxWidth: .infinity, alignment: .leading)
                
                Text("Add payment")
                    .foregroundColor(Color("gr"))
                    .font(.system(size: 32, weight: .semibold))
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.top)
                    .padding(.bottom)
                
                HStack {
                    
                    ForEach(viewModel.operatoins, id: \.self) { index in
                        
                        Button(action: {
                            
                            viewModel.current_operation = index
                            
                        }, label: {
                            
                            Text(index)
                                .foregroundColor(viewModel.current_operation == index ? Color("gr") : .white)
                                .font(.system(size: 16, weight: .semibold))
                        })
                        .padding(.horizontal)
                    }
                }
                
                Text("Payments name")
                    .foregroundColor(.white)
                    .font(.system(size: 15, weight: .regular))
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.top)
                
                ZStack(alignment: .leading, content: {
                    
                    Text("ex.: Car rental agreement")
                        .foregroundColor(.gray)
                        .font(.system(size: 14, weight: .regular))
                        .opacity(viewModel.operName.isEmpty ? 1 : 0)
                        .padding(.horizontal, 15)
                    
                    TextField(" ", text: $viewModel.operName)
                        .foregroundColor(.gray)
                        .font(.system(size: 14, weight: .regular))
                        .keyboardType(.numberPad)
                        .padding(8)
                        .background(RoundedRectangle(cornerRadius: 3).fill(Color.white.opacity(0.2)))
                })
                
                Text("Money")
                    .foregroundColor(.white)
                    .font(.system(size: 15, weight: .regular))
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                ZStack(alignment: .leading, content: {
                    
                    Text("$")
                        .foregroundColor(.gray)
                        .font(.system(size: 14, weight: .regular))
                        .opacity(viewModel.oper.isEmpty ? 1 : 0)
                        .padding(.horizontal, 15)
                    
                    TextField(" $", text: $viewModel.oper)
                        .foregroundColor(.gray)
                        .font(.system(size: 14, weight: .regular))
                        .keyboardType(.numberPad)
                        .textContentType(.oneTimeCode)
                        .padding(8)
                        .background(RoundedRectangle(cornerRadius: 3).fill(Color.white.opacity(0.2)))
                })
                
                Spacer()
                
                Button(action: {
                    
                    if viewModel.current_operation == "Expenses" {
                        
                        viewModel.expenses += Int("\(viewModel.oper)") ?? 0
                        
                        viewModel.history_payments.append("\(viewModel.operName)                                      -\(viewModel.oper)$")
                        
                        viewModel.oper = ""
                        
                        
                        
                    } else {
                        
                        viewModel.income += Int("\(viewModel.oper)") ?? 0
                        
                        viewModel.history_payments.append("\(viewModel.operName)                                      +\(viewModel.oper)$")
                        
                        viewModel.oper = ""
                        
                    }
                    
                    router.wrappedValue.dismiss()
                    
                }, label: {
                    
                    Text(viewModel.current_operation == "Income" ? "Add Income" : "Add Expenses")
                        .foregroundColor(.white)
                        .font(.system(size: 16, weight: .semibold))
                        .frame(maxWidth: .infinity)
                        .frame(height: 50)
                        .background(RoundedRectangle(cornerRadius: 8).fill(Color("gr")))
                        .padding()
                })
            }
            .padding(.horizontal)
        }
    }
}

struct AddPayment_Previews: PreviewProvider {
    static var previews: some View {
        AddPayment()
    }
}
