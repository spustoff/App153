//
//  TabBar.swift
//  App153
//
//  Created by IGOR on 21/07/2023.
//

import SwiftUI

struct TabBar: View {
    
    @Binding var selectedTab: Tab
    
    @State var tabs: [Tab] = [Tab.Main, Tab.Statistics, Tab.Payments, Tab.Settings]
    
    var body: some View {
        
        HStack {
            
            ForEach(Tab.allCases, id: \.self) { index in
                
                Button(action: {
                    
                    selectedTab = index
                    
                }, label: {
                    
                    VStack(alignment: .center, spacing: 5, content: {
                            
                        Image(index.rawValue)
                            .renderingMode(.template)
                            .foregroundColor(selectedTab == index ? Color("gr") : Color.gray)

                        Text(index.rawValue)
                            .foregroundColor(selectedTab == index ? Color("gr") : Color.gray)
                            .font(.system(size: 10, weight: .medium))
                    })
                    .frame(maxWidth: .infinity)
                })
            }
        }
        .frame(maxWidth: .infinity)
        .padding(.horizontal)
        .padding(.top, 9)
        .padding(.bottom, 35)
        .background(Color("bg"))
    }
}

enum Tab: String, CaseIterable {
    
    case Main = "Main"
    
    case Statistics = "Statistics"
    
    case Payments = "Payments"
    
    case Settings = "Settings"

}
