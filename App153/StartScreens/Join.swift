//
//  Join.swift
//  App153
//
//  Created by IGOR on 20/07/2023.
//

import SwiftUI

struct Join: View {
    
    let telegram: URL
    
    var body: some View {

        ZStack {
            
            Color("bg")
                .ignoresSafeArea()
            
            VStack {
                
                Image("Join")
                    .resizable()
                    .frame(height: 475)
                
                Text("Join our Telegram Channel")
                    .foregroundColor(.white)
                    .font(.system(size: 29, weight: .semibold))
                    .multilineTextAlignment(.center)
                    .padding()
                
                Text("And trade with our team")
                    .foregroundColor(.gray)
                    .font(.system(size: 16, weight: .regular))
                
                Spacer()

                NavigationLink(destination: {
                    
                    Push()
                        .navigationBarBackButtonHidden()
                    
                }, label: {
                    
                    Text("Skip")
                        .foregroundColor(Color("gr"))
                        .font(.system(size: 15, weight: .medium))
                        .frame(maxWidth: .infinity)
                        .frame(height: 50)
                })
                
                Button(action: {
                    
                    UIApplication.shared.open(telegram)
                    
                }, label: {
                    
                    Text("Join us")
                        .foregroundColor(.white)
                        .font(.system(size: 15, weight: .regular))
                        .frame(maxWidth: .infinity)
                        .frame(height: 50)
                        .background(RoundedRectangle(cornerRadius: 15).fill(Color("b")))
                })
                .padding(.horizontal)
                .padding(.bottom, 30)
            }
        }
        .ignoresSafeArea(.all, edges: .top)
    }
}

struct Join_Previews: PreviewProvider {
    static var previews: some View {
        Join(telegram: URL(string: "h")!)
    }
}
