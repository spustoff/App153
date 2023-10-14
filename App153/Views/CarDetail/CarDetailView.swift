//
//  CarDetailView.swift
//  App153
//
//  Created by IGOR on 20/07/2023.
//

import SwiftUI

struct CarDetailView: View {
    
    @Environment(\.presentationMode) var router
    @StateObject var viewModel: MainViewModel
    
    let index: AddModel
    
    var body: some View {
        
        ZStack {
            
            Color("bg")
                .ignoresSafeArea()
            
            VStack {
                
                ZStack {
                    
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
                    
                    Text(index.name)
                        .foregroundColor(.white)
                        .font(.system(size: 22, weight: .semibold))
                }
                
                VStack(alignment: .leading) {
                    
                    Image(index.name)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                    
                    HStack {
                        
                        Text(index.name)
                            .foregroundColor(.white)
                            .font(.system(size: 18, weight: .regular))
                        
                        Spacer()
                        
                        Text("$ \(index.sum)")
                            .foregroundColor(Color("gr"))
                            .font(.system(size: 18, weight: .regular))
                    }
                    .padding(8)
                    
                    Text("No rented")
                        .foregroundColor(.red)
                        .font(.system(size: 14, weight: .regular))
                        .padding(.horizontal, 8)
                        .padding(.bottom)
                }
                .background(RoundedRectangle(cornerRadius: 8).fill(Color("bg2")))
                .padding(.vertical)
                
                HStack {
                    
                    Text("Current price")
                        .foregroundColor(.white)
                        .font(.system(size: 15, weight: .regular))
                    
                    Spacer()
                    
                    Text("$ \(index.sum)")
                        .foregroundColor(.white)
                        .font(.system(size: 14, weight: .regular))
                }
                
                RoundedRectangle(cornerRadius: 5)
                    .fill(Color.gray.opacity(0.2))
                    .frame(maxWidth: .infinity)
                    .frame(height: 2)
                
                HStack {
                    
                    Text("Your tenant")
                        .foregroundColor(.white)
                        .font(.system(size: 15, weight: .regular))
                    
                    Spacer()

                    ZStack(alignment: .trailing, content: {
                        
                        Text("Nobody")
                            .foregroundColor(viewModel.tenant.isEmpty ? .gray : .white)
                            .font(.system(size: 13, weight: .medium))
                            .opacity(viewModel.tenant.isEmpty ? 1 : 0)
                        
                        TextField("", text: $viewModel.tenant)
                            .foregroundColor(.white)
                            .font(.system(size: 13, weight: .medium))
                            .multilineTextAlignment(.trailing)
                    })
                }
                
                RoundedRectangle(cornerRadius: 5)
                    .fill(Color.gray.opacity(0.2))
                    .frame(maxWidth: .infinity)
                    .frame(height: 2)
                
                HStack {
                    
                    Text("Dates")
                        .foregroundColor(.white)
                        .font(.system(size: 15, weight: .regular))
                    
                    Spacer()

                    DatePicker("Departure", selection: $viewModel.dateFrom, in: Date()..., displayedComponents: .date)
                        .labelsHidden()
                    
                    DatePicker("Departure", selection: $viewModel.dateTo, in: Date()..., displayedComponents: .date)
                        .labelsHidden()
                }
                
                RoundedRectangle(cornerRadius: 5)
                    .fill(Color.gray.opacity(0.2))
                    .frame(maxWidth: .infinity)
                    .frame(height: 2)
                
                Spacer()
                
                Button(action: {
                    
                    viewModel.whichCar = index.name
                    
                    viewModel.addToHistory {
                        
                        viewModel.whichCar = ""
                        viewModel.tenant = ""
                        
                        viewModel.fetchHistory()
                        
                        router.wrappedValue.dismiss()
                    }
                    
                }, label: {
                    
                    Text("Save")
                        .foregroundColor(.white)
                        .font(.system(size: 16, weight: .regular))
                        .frame(maxWidth: .infinity)
                        .frame(height: 50)
                        .background(RoundedRectangle(cornerRadius: 8).fill(Color("gr")))
                        .padding(.vertical)
                })
                
            }
            .padding(.horizontal)
        }
    }
}

struct CarDetailView_Previews: PreviewProvider {
    static var previews: some View {
        CarDetailView(viewModel: MainViewModel(), index: AddModel(name: "Volcano", sum: 2300))
    }
}
