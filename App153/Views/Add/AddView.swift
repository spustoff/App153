//
//  AddView.swift
//  App153
//
//  Created by IGOR on 20/07/2023.
//

import SwiftUI

struct AddView: View {
    
    @StateObject var viewModel: MainViewModel
    
    @Environment(\.presentationMode) var router
    
    var body: some View {
        
        ZStack {
            
            Color("bg")
                .ignoresSafeArea()
            
            VStack {
                
                Button(action: {
                    
                    router.wrappedValue.dismiss()
                    
                }, label: {
                    
                    HStack {
                        
                        Image(systemName: "chevron.left")
                            .foregroundColor(Color("gr"))
                            .font(.system(size: 15, weight: .regular))
                        
                        Text("Back")
                            .foregroundColor(Color("gr"))
                            .font(.system(size: 15, weight: .regular))
                        
                        
                    }
                })
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.bottom)
                
                ScrollView(.vertical, showsIndicators: false) {
                    
                    LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], content: {
                        
                        ForEach(viewModel.car) { index in
                            
                            Button(action: {
                                
                                viewModel.current_car = index
                                viewModel.isDetail = true
                                
                            }, label: {
                                
                                VStack(alignment: .leading, spacing: 5) {
                                    
                                    Image(index.name)
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                    
                                    VStack(alignment: .leading, spacing: 5) {
                                        
                                        Text("$ \(index.sum)")
                                            .foregroundColor(Color("gr"))
                                        
                                        Text(index.name)
                                            .foregroundColor(.white)
                                        
                                    }
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                    .padding(.horizontal, 5)
                                }
                                .background(RoundedRectangle(cornerRadius: 8).fill(Color("bg2")))
                            })
                        }
                    })
                }
                
            }
            .padding(.horizontal)
        }
        .fullScreenCover(isPresented: $viewModel.isDetail, content: {
            
            if let index = viewModel.current_car {
                
                CarDetailView(viewModel: viewModel, index: index)
            }
        })
        .onChange(of: viewModel.history.count, perform: { _ in
            
            router.wrappedValue.dismiss()
        })
    }
}

struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        AddView(viewModel: MainViewModel())
    }
}
