//
//  PaymentsView.swift
//  App153
//
//  Created by IGOR on 21/07/2023.
//

import SwiftUI

struct PaymentsView: View {
    
    @StateObject var viewModel = PaymentsViewModel()
    @Environment(\.presentationMode) var router
    @State var isAdd: Bool = false
    
    var body: some View {
        
        ZStack {
            
            Color("bg")
                .ignoresSafeArea()
            
            VStack {
                
                HStack {
                    
                    Text("General Payments")
                        .foregroundColor(Color("gr"))
                        .font(.system(size: 32, weight: .semibold))
                    
                    Spacer()
                    
                    Button(action: {
                        
                        isAdd = true
                        
                    }, label: {
                        
                        Text("+")
                            .foregroundColor(Color("gr"))
                            .font(.system(size: 24, weight: .semibold))
                    })
                }
                .padding()
                
                if viewModel.history_payments.isEmpty {
                    
                    VStack(alignment: .center) {
                        
                        Text("No payments added")
                            .foregroundColor(.gray)
                            .font(.system(size: 16, weight: .semibold))
                        
                        Text("Click «+» on the button to start tracking car income")
                            .foregroundColor(.gray)
                            .font(.system(size: 14, weight: .regular))
                            .multilineTextAlignment(.center)
                    }
                    .frame(maxHeight: .infinity, alignment: .center)
                    
                } else {
                    
                    ScrollView(.vertical, showsIndicators: true) {
                        
                        LazyVStack {
                            
                            ForEach(viewModel.history_payments, id: \.self) { index in
                                
                                HStack {
                                    
                                    Text(index)
                                        .foregroundColor(.gray)
                                        .font(.system(size: 14, weight: .semibold))
                                    
                                    Spacer()
                                }
                                .padding()
                                .frame(maxWidth: .infinity)
                                .background(RoundedRectangle(cornerRadius: 5).fill(.gray.opacity(0.2)))
                            }
                        }
                        .padding(.horizontal)
                    }
                }
                
                Spacer()
            }
            
        }
        .fullScreenCover(isPresented: $isAdd, content: {
            
            AddPayment()
        })
    }
}

struct PaymentsView_Previews: PreviewProvider {
    static var previews: some View {
        PaymentsView()
    }
}
