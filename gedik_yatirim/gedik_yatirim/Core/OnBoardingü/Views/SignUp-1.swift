//
//  SignUp-1.swift
//  gedik_yatirim
//
//  Created by Hasan on 2.08.2024.
//

import SwiftUI

struct SignUp_1: View {
    @Environment(\.dismiss) var dismiss
    

    @StateObject var viewModel = SignUp_1ViewViewModel()
    
    
    var body: some View {
        NavigationStack {
            ZStack {
                VStack{
                    CustomHeader()
                    
                    Image("Logo")
                        .padding(.top,41)
                    Text("Cep Telefonu Numaranızı Giriniz.")
                        .modifier(gedik_text_black())
                        .padding(10)
                        .frame(height: 64, alignment: .center)
                    HStack{
                        HStack{
                            VStack{
                                Text("Alan Kodu")
                                    .modifier(textFieldTitle())
                                HStack{
                                    Image("emojione_flag-for-turkey")
                                    Text("+90")
                                        .font(
                                            Font.custom("Plus Jakarta Sans", size: 13)
                                                .weight(.medium)
                                        )
                                        .foregroundColor(Constants.LabelColorSecondary)
                                        .frame(maxWidth: .infinity, alignment: .topLeading)
                                }
                            }
                            Button {} label: {
                                Image("chevron-down")
                            }
                            
                            
                            
                        }
                        .padding(.horizontal, 12)
                        .padding(.vertical, 8)
                        .frame(width: 116, height: 58, alignment: .center)
                        .background(Constants.BackgroundTertiary)
                        .cornerRadius(8)
                        .overlay(
                            RoundedRectangle(cornerRadius: 8)
                                .inset(by: 0.5)
                                .stroke(Constants.GreyGrey300, lineWidth: 1)
                        )
                        .padding(.leading)
                        
                        VStack{
                            Text("Telefon Numarası")
                                .modifier(textFieldTitle())
                            TextField("Telefon Numaranızı Giriniz" , text: $viewModel.phoneNumber)
                                .modifier(textFieldText())
                                .font(
                                    Font.custom("Plus Jakarta Sans", size: 14)
                                        .weight(.medium)
                                )
                                .foregroundColor(Constants.LabelColorPrimary)
                                .keyboardType(.numberPad) // Sayısal klavye sağlar
                                .onChange(of: viewModel.phoneNumber) { _ in

                                    viewModel.filter()
                                    
                                }
                        }
                        .padding(.horizontal, 12)
                        .padding(.vertical, 8)
                        .frame(maxWidth: .infinity, minHeight: 58, maxHeight: 58, alignment: .topLeading)
                        .background(Constants.BackgroundTertiary)
                        .cornerRadius(8)
                        .overlay(
                            RoundedRectangle(cornerRadius: 8)
                                .inset(by: 0.5)
                                .stroke(Constants.GreyGrey300, lineWidth: 1)
                        ).padding(.trailing)
                    }
                    
                    
                    
                    Spacer()
//                    NavigationLink {
//                        Webview()
//                            .navigationBarBackButtonHidden()
//                        
//                    } label: {
//                        Text("KVKK Bildirimine ve Gizlilik Politikamıza\nburadan ulaşabilirsiniz")
//                            .font(Font.custom("Plus Jakarta Sans", size: 13))
//                            .underline()//yazının altını çiziyor
//                            .multilineTextAlignment(.center)
//                            .foregroundColor(Constants.FillColorFillColor600)
//                            .padding(.bottom,16)
//                    }
//                    
                    
                        
                    NavigationLink(destination: SignUp_1_2(phoneNumber: $viewModel.phoneNumber), isActive: $viewModel.isNavigationActive) {
                        Button {
                        
                            viewModel.SignUp()
                              
                        } label: {
                            Text("Devam Et")
                                .modifier(buttonBlue())
                        }
                        
                       
                    }

                    
                }
            }
            .background(Constants.BackgroundPrimary)
            .onTapGesture {
                        // End editing in the current window
                        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
                    }
        }
        .alert(isPresented: $viewModel.showAlert) {
            Alert(
                title: Text("Hata"),
                message: Text(viewModel.alertMessage),
                dismissButton: .default(Text("Tamam"))
            )
        }
    }
}

#Preview {
    SignUp_1()
}
