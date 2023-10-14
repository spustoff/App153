//
//  USplash2.swift
//  App153
//
//  Created by IGOR on 20/07/2023.
//

import SwiftUI

struct USplash2: View {
    
    let telegram: URL
    let isTelegram: Bool
    
    var body: some View {

        ZStack {
            
            Color("bg")
                .ignoresSafeArea()
            
            VStack {
                
                Image("USplash2")
                    .resizable()
                    .frame(height: 475)
                
                Text("Follow all the important changes")
                    .foregroundColor(.white)
                    .font(.system(size: 29, weight: .semibold))
                    .multilineTextAlignment(.center)
                    .padding()
                
                Text("Look at finance in a new way")
                    .foregroundColor(.gray)
                    .font(.system(size: 16, weight: .regular))
                
                Spacer()
                
                HStack {

                    Circle()
                        .fill(Color.white.opacity(0.2))
                        .frame(width: 8, height: 8)
                    
                    Circle()
                        .fill(Color.white)
                        .frame(width: 8, height: 8)
                    
                    Circle()
                        .fill(Color.white.opacity(0.2))
                        .frame(width: 8, height: 8)
                }
                
                NavigationLink(destination: {
                    
                    Reviews(telegram: telegram, isTelegram: isTelegram)
                        .navigationBarBackButtonHidden()
                    
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
    }
}

struct USplash2_Previews: PreviewProvider {
    static var previews: some View {
        USplash2(telegram: URL(string: "h")!, isTelegram: false)
    }
}
