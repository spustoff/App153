//
//  MainView.swift
//  App153
//
//  Created by IGOR on 20/07/2023.
//

import SwiftUI

struct MainView: View {
    
    @StateObject var viewModel = MainViewModel()
    
    var body: some View {

        ZStack {
            
            Color("bg")
                .ignoresSafeArea()
            
            VStack {
                
                HStack {
                    
                    Text("Main")
                        .foregroundColor(Color("gr"))
                        .font(.system(size: 32, weight: .semibold))
                    
                    Spacer()
                    
                    Button(action: {
                        
                        viewModel.isAdd = true
                        
                    }, label: {
                        
                        Text("+")
                            .foregroundColor(Color("gr"))
                            .font(.system(size: 24, weight: .semibold))
                        
                    })
                }
                .padding()
                
                if viewModel.history.isEmpty {
                    
                    VStack {
                        
                        Image("empty")
                            .padding(.vertical, 70)
                        
                        Text("No cars added")
                            .foregroundColor(.gray)
                            .font(.system(size: 18, weight: .regular))
                            .padding()
                        
                        Text("Click «+» on the button to start tracking car income")
                            .foregroundColor(.gray)
                            .font(.system(size: 16, weight: .regular))
                            .multilineTextAlignment(.center)
                            .frame(width: 220)
                        
                        Spacer()
                        
                    }
                    .padding(.horizontal)
                    .frame(maxHeight: .infinity, alignment: .center)
                    
                } else {
                    
                    ScrollView(.vertical, showsIndicators: true) {
                        
                        LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], content: {
                            
                            ForEach(viewModel.getItems(), id: \.self) { index in
                                
                                VStack(alignment: .leading, spacing: 5) {
                                    
                                    Image(index.current_car ?? "")
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                    
                                    VStack(alignment: .leading, spacing: 5) {
                                        
                                        Text("Rented car: \(index.current_car ?? "")")
                                            .foregroundColor(Color("gr"))
                                            .font(.system(size: 14, weight: .medium))
                                    }
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                    .padding()
                                }
                                .background(RoundedRectangle(cornerRadius: 8).fill(Color("bg2")))
                            }
                        })
                        .padding()
                    }
                }
                
                Spacer()
            }
        }
        .fullScreenCover(isPresented: $viewModel.isAdd, content: {
            
            AddView(viewModel: viewModel)
        })
        .onAppear {
            
            viewModel.fetchHistory()
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
