//
//  Reviews.swift
//  App153
//
//  Created by IGOR on 20/07/2023.
//

import SwiftUI
import StoreKit

struct Reviews: View {
    
    let telegram: URL
    let isTelegram: Bool
    
    var body: some View {

        ZStack {
            
            Color("bg")
                .ignoresSafeArea()
            
            VStack {
                
                Image("Reviews")
                    .resizable()
                    .frame(height: 475)
                
                Text("Rate our App")
                    .foregroundColor(.white)
                    .font(.system(size: 29, weight: .semibold))
                    .multilineTextAlignment(.center)
                    .padding()
                
                Text("Leave your minds in the AppStore")
                    .foregroundColor(.gray)
                    .font(.system(size: 16, weight: .regular))
                
                Spacer()
                
                HStack {

                    Circle()
                        .fill(Color.white.opacity(0.2))
                        .frame(width: 8, height: 8)
                    
                    Circle()
                        .fill(Color.white.opacity(0.2))
                        .frame(width: 8, height: 8)
                    
                    Circle()
                        .fill(Color.white)
                        .frame(width: 8, height: 8)
                }
                
                NavigationLink(destination: {
                    
                    if isTelegram == true {
                        
                        Join(telegram: telegram)
                            .navigationBarBackButtonHidden()
                        
                    } else if isTelegram == false {
                        
                        Push()
                            .navigationBarBackButtonHidden()
                    }
                    
                }, label: {
                    
                    Text("Next")
                        .foregroundColor(.white)
                        .font(.system(size: 15, weight: .medium))
                        .frame(maxWidth: .infinity)
                        .frame(height: 50)
                        .background(RoundedRectangle(cornerRadius: 8).fill(Color("gr")))
                        .padding()
                })
                .padding(.bottom, 30)
                
            }
        }
        .ignoresSafeArea()
        .onAppear {
            
            SKStoreReviewController.requestReview()
        }
    }
}
struct Reviews_Previews: PreviewProvider {
    static var previews: some View {
        Reviews(telegram: URL(string: "h")!, isTelegram: false)
    }
}
