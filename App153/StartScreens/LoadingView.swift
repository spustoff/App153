//
//  LoadingView.swift
//  App153
//
//  Created by IGOR on 21/07/2023.
//

import SwiftUI

struct LoadingView: View {
    
    var body: some View {
        
        ZStack {
            
            Color("gr")
                .ignoresSafeArea()
            
            Image("logo_2")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 150, height: 150)
            
            VStack {
                
                Spacer()
                
                ProgressView()
            }
        }
    }
}

struct LoadingView_Previews: PreviewProvider {
    static var previews: some View {
        LoadingView()
    }
}
