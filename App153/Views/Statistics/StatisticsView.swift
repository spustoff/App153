//
//  StatisticsView.swift
//  App153
//
//  Created by IGOR on 20/07/2023.
//

import SwiftUI

struct StatisticsView: View {

    @StateObject var viewModel = StatisticsViewModel()
    
    var body: some View {
        
        ZStack {
            
            Color("bg")
                .ignoresSafeArea()
            
            VStack {
                
                Text("Statistics")
                    .foregroundColor(Color("gr"))
                    .font(.system(size: 32, weight: .semibold))
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.top)
                    .padding(.horizontal)
                
                HStack {
                    
                    Text("Total balance")
                        .foregroundColor(.white)
                        .font(.system(size: 14, weight: .regular))
                    
                    Spacer()
                    
                    Button(action: {
                        
                        withAnimation(.spring()) {
                            
                            viewModel.isMenu = true
                        }
                        
                    }, label: {
                        
                        HStack {
                            
                            Image("USA")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 23, height: 23)
                            
                            Text("USD")
                                .foregroundColor(.white)
                            
                            Image(systemName: "arrowtriangle.down.fill")
                                .foregroundColor(Color("gr"))
                                .font(.system(size: 14, weight: .regular))
                        }
                        
                    })

                }
                .padding(.vertical, 2)
                .padding(.horizontal)
                
                Text("$ \(viewModel.balance)")
                    .foregroundColor(.white)
                    .font(.system(size: 24, weight: .semibold))
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.horizontal)
                
                ScrollView(.vertical, showsIndicators: false) {
                        
                    VStack {
                            
                            Text("Rental Income")
                                .foregroundColor(.white)
                                .font(.system(size: 16, weight: .regular))
                                .frame(maxWidth: .infinity, alignment: .leading)
                        
                        Text("$\(viewModel.income)")
                            .foregroundColor(.white)
                            .font(.system(size: 20, weight: .medium))
                            .frame(maxWidth: .infinity, alignment: .leading)

                        }
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(RoundedRectangle(cornerRadius: 10).fill(Color("bg")))
                    .padding()
                    
                    VStack {
                            
                            Text("Amount of cars")
                                .foregroundColor(.white)
                                .font(.system(size: 16, weight: .regular))
                                .frame(maxWidth: .infinity, alignment: .leading)
                        
                        Text("\(viewModel.carAmount)")
                            .foregroundColor(.white)
                            .font(.system(size: 20, weight: .medium))
                            .frame(maxWidth: .infinity, alignment: .leading)

                        }
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(RoundedRectangle(cornerRadius: 10).fill(Color("bg")))
                    .padding(.horizontal)
                    
                    VStack {
                            
                            Text("Spemding on expenses")
                                .foregroundColor(.white)
                                .font(.system(size: 16, weight: .regular))
                                .frame(maxWidth: .infinity, alignment: .leading)
                        
                        Text("$\(viewModel.expenses)")
                            .foregroundColor(.white)
                            .font(.system(size: 20, weight: .medium))
                            .frame(maxWidth: .infinity, alignment: .leading)

                        }
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(RoundedRectangle(cornerRadius: 10).fill(Color("bg")))
                    .padding()
                    
                }
                .frame(maxWidth: .infinity)
                .background(RoundedRectangle(cornerRadius: 10).fill(Color("bg2")))
            }
        }
        .ignoresSafeArea(.all, edges: .bottom)
        .overlay (
            
            detailPairs()
        )
    }
    
    @ViewBuilder
    func detailPairs() -> some View {
        
        ZStack {
            
            Color.black.opacity(viewModel.isMenu ? 0.5 : 0)
                .ignoresSafeArea()
                .onTapGesture {
                    
                    withAnimation(.spring()) {
                        
                        viewModel.isMenu = false
                    }
                }
            
            VStack {
                
                ZStack {
                    
                    HStack {
                        
                        Button(action: {
                            
                            withAnimation(.spring()) {
                                
                                viewModel.isMenu = false
                            }
                            
                        }, label: {
                            
                            Image(systemName: "xmark")
                                .foregroundColor(.black)
                                .font(.system(size: 13, weight: .regular))
                                .background(Circle().fill(Color.white.opacity(0.2)).frame(width: 23, height: 23))
                            
                        })

                        
                        Spacer()
                    }
                    
                    Text("Choose one")
                        .foregroundColor(.white)
                        .font(.system(size: 16, weight: .regular))
                }
                .padding(.bottom)
                
                ScrollView(.vertical, showsIndicators: false) {
                    
                    LazyVStack {
                        
                        ForEach(viewModel.pairs, id: \.self) { index in
                            
                            HStack {
                                
                                Image(index)
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 23, height: 23)
                                
                                Text(index)
                                    .foregroundColor(.white)
                                    .font(.system(size: 15, weight: .regular))
                                
                                Spacer()
                                
                                Button(action: {
                                    
                                    viewModel.current_pair = index
                                    
                                }, label: {
                                    
                                    ZStack {
                                        
                                        Circle()
                                            .stroke(Color("gr"))
                                            .frame(width: 20, height: 20)
                                        
                                        Circle()
                                            .fill(Color("gr"))
                                            .frame(width: 14, height: 14)
                                            .opacity(viewModel.current_pair == index ? 1 : 0)
                                    }
                                })
                            }
                            .padding(.vertical, 9)
                        }
                    }
                }
                
                NavigationLink(destination: {
                      
                    TradeGraph(index: viewModel.current_pair)
                        .navigationBarBackButtonHidden()

                }, label: {
                    
                    Text("Choose")
                        .foregroundColor(.white)
                        .font(.system(size: 16, weight: .semibold))
                        .frame(maxWidth: .infinity)
                        .frame(height: 50)
                        .background(RoundedRectangle(cornerRadius: 8).fill(Color("gr")))
                        .padding()
                })
            }
            .frame(maxWidth: .infinity)
            .padding()
            .background(RoundedRectangle(cornerRadius: 10).fill(Color("bg")))
//            .padding()
            .offset(y: viewModel.isMenu ? 0 : UIScreen.main.bounds.height)
        }
    }
}

struct StatisticsView_Previews: PreviewProvider {
    static var previews: some View {
        StatisticsView()
    }
}
