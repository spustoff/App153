//
//  TradeGraph.swift
//  App153
//
//  Created by IGOR on 20/07/2023.
//

import SwiftUI

struct TradeGraph: View {
    
    @StateObject var viewModel = StatisticsViewModel()
    @Environment(\.presentationMode) var router
    
    let index: String
    
    var body: some View {
        
        ZStack {
            
            Color("bg")
                .ignoresSafeArea()
            
            VStack {
                
                HStack {
                    
                    Button(action: {
                        
                        router.wrappedValue.dismiss()
                        
                    }, label: {
                            
                            Image(systemName: "xmark")
                                .foregroundColor(.white)
                                .font(.system(size: 14, weight: .regular))
                    })
                    
                    Spacer()
                    
                    Text(index)
                        .foregroundColor(.white)
                    
                    Spacer()
                }
                .padding()
                
                ScrollView(.horizontal, showsIndicators: false) {
                    
                    HStack {
                        
                        ForEach(viewModel.intervals, id: \.self) { index in
                            
                            Text("\(index) min.")
                                .foregroundColor(viewModel.current_interval == index ? Color("gr") : .gray)
                                .font(.system(size: 13, weight: .regular))
                                .padding(9)
                                .background(RoundedRectangle(cornerRadius: 8).stroke(viewModel.current_interval == index ? Color("gr") : .gray))
                                .onTapGesture {
                                    
                                    viewModel.current_interval = index
                                }
                        }
                    }
                    .padding()
                }
                
                TradeChart(pair: index, interval: viewModel.current_interval)
                    .disabled(true)
                
            }
        }
    }
}

struct TradeGraph_Previews: PreviewProvider {
    static var previews: some View {
        TradeGraph(viewModel: StatisticsViewModel(), index: "USDEUR")
    }
}
