//
//  RSplash.swift
//  App153
//
//  Created by IGOR on 20/07/2023.
//

import SwiftUI

struct RSplash: View {
    
    var body: some View {

        ZStack {
            
            Color("bg")
                .ignoresSafeArea()
            
            VStack {
                
                Image("RSplash")
                
                Text("The ability to monitor and analyze data")
                    .foregroundColor(.white)
                    .font(.system(size: 29, weight: .semibold))
                    .multilineTextAlignment(.center)
                    .padding()
                
                Text("Сustomize under your control")
                    .foregroundColor(.gray)
                    .font(.system(size: 16, weight: .regular))
                
                Spacer()
                
                HStack {
                    
                    Circle()
                        .fill(Color.white)
                        .frame(width: 8, height: 8)
                    
                    Circle()
                        .fill(Color.white.opacity(0.2))
                        .frame(width: 8, height: 8)
                }
                
                NavigationLink(destination: {
                    
                    RSplash2()
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

struct RSplash_Previews: PreviewProvider {
    static var previews: some View {
        RSplash()
    }
}
