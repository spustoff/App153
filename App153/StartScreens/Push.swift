//
//  Push.swift
//  App153
//
//  Created by IGOR on 20/07/2023.
//

import SwiftUI
import OneSignal

struct Push: View {
    
    @AppStorage("status") var status: Bool = false
    
    var body: some View {

        ZStack {
            
            Color("bg")
                .ignoresSafeArea()
            
            VStack {
                
                Image("users_5")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                
                Text("Don't miss anything important")
                    .foregroundColor(.white)
                    .font(.system(size: 29, weight: .semibold))
                    .multilineTextAlignment(.center)
                    .padding()
                
                Text("The most up-to-date information especially for you")
                    .foregroundColor(.gray)
                    .font(.system(size: 16, weight: .regular))
                    .multilineTextAlignment(.center)
                    .padding(.horizontal)
                
                Spacer()
                
                Button(action: {
                    
                    status = true
                    
                }, label: {
                    
                    Text("Skip")
                        .foregroundColor(Color("gr"))
                        .font(.system(size: 15, weight: .medium))
                        .frame(maxWidth: .infinity)
                        .frame(height: 50)
                })
                
                Button(action: {
                    
                    status = true
                    
                }, label: {
                    
                    Text("Enable notifications")
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

struct Push_Previews: PreviewProvider {
    static var previews: some View {
        Push()
    }
}
