//
//  SettingsView.swift
//  App153
//
//  Created by IGOR on 21/07/2023.
//

import SwiftUI
import StoreKit

struct SettingsView: View {
    
    @AppStorage("history_payments") var history_payments: [String] = []
    
    @State var isReset: Bool = false

    var body: some View {
        
        ZStack {
            
            Color("bg")
                .ignoresSafeArea()
            
            VStack {
                
                HStack {
                    
                    Text("Settings")
                        .foregroundColor(Color("gr"))
                        .font(.system(size: 32, weight: .semibold))
                    
                    Spacer()
                }
                .padding()
                
                VStack {
                    
                    Button(action: {
                        
                        SKStoreReviewController.requestReview()

                    }, label: {
                        
                        HStack {
                            
                            Image(systemName: "star.fill")
                                .foregroundColor(Color("gr"))
                            
                            Text("Rate app")
                                .foregroundColor(.white)
                                .font(.system(size: 16, weight: .regular))
                            
                            Spacer()
                            
                            Image(systemName: "chevron.right")
                                .foregroundColor(.white)
                                .font(.system(size: 18, weight: .regular))
                        }
                    })
                    .padding(.vertical)
                    
                    Button(action: {
                        
                        guard let url = URL(string: "https://docs.google.com/document/d/1pcYZSBYsvS2KiYTeDHChSulId406aBRzvlkHhdW-tJ8/edit?usp=sharing") else { return }
                        
                        UIApplication.shared.open(url)

                    }, label: {
                        
                        HStack {
                            
                            Image(systemName: "bubble.right.fill")
                                .foregroundColor(Color("gr"))
                            
                            Text("Usage Policy")
                                .foregroundColor(.white)
                                .font(.system(size: 16, weight: .regular))
                            
                            Spacer()
                            
                            Image(systemName: "chevron.right")
                                .foregroundColor(.white)
                                .font(.system(size: 18, weight: .regular))
                        }
                    })
                    
                    Button(action: {
                        
                        withAnimation(.spring()) {
                            
                            isReset = true
                        }

                    }, label: {
                        
                        HStack {
                            
                            Image(systemName: "arrow.triangle.2.circlepath")
                                .foregroundColor(.red)
                            
                            Text("Reset progress")
                                .foregroundColor(.red)
                                .font(.system(size: 16, weight: .regular))
                            
                            Spacer()
                            
                            Image(systemName: "chevron.right")
                                .foregroundColor(.white)
                                .font(.system(size: 18, weight: .regular))
                        }
                    })
                    .padding(.vertical)
                    
                    Spacer()
                }
                .padding()
                .frame(maxWidth: .infinity)
                .background(Color("bg"))
            }
            .ignoresSafeArea(.all, edges: .bottom)
        }
        .overlay (
            
            ZStack {
                
                Color.black.opacity(isReset ? 0.5 : 0)
                    .ignoresSafeArea()
                    .onTapGesture {
                        
                        withAnimation(.spring()) {
                            
                            isReset = false
                        }
                    }
                
                VStack {
                    
                    HStack {
                        
                        Spacer()
                        
                        Button(action: {
                            
                            withAnimation(.spring()) {
                                
                                isReset = false
                            }
                            
                        }, label: {
                            
                            Image(systemName: "xmark")
                                .foregroundColor(.black)
                                .font(.system(size: 15, weight: .regular))
                        })
                    }
                    
                    Text("Reset data?")
                        .foregroundColor(.black)
                        .font(.system(size: 24, weight: .semibold))
                        .padding()
                    
                    Text("All your data will be cleared. You can log in again.")
                        .foregroundColor(.black)
                        .font(.system(size: 16, weight: .regular))
                        .multilineTextAlignment(.center)
                    
                    Button(action: {

                        history_payments.removeAll()
                        
                        withAnimation(.spring()) {
                            
                            isReset = false
                        }
                        
                    }, label: {
                        
                        Text("Reset")
                            .foregroundColor(.red)
                            .font(.system(size: 18, weight: .semibold))
                            .frame(maxWidth: .infinity)
                            .frame(height: 40)

                    })
                    .padding(.top, 25)
                }
                .frame(maxWidth: .infinity)
                .padding()
                .background(RoundedRectangle(cornerRadius: 10).fill(Color.white.opacity(0.7)))
                .padding()
                .offset(y: isReset ? 0 : UIScreen.main.bounds.height)
            }
        )
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
