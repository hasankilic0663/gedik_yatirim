//
//  SignUp-1.swift
//  gedik_yatirim
//
//  Created by Hasan on 2.08.2024.
//

import SwiftUI

struct SignUp_1_2: View {
    @Environment(\.dismiss) var dismiss
    @State private var phoneNumber : String = ""
    @State private var tcNumber : String = ""
    @State private var permission = false
    @State private var permission2 = false
    @State private var showTCFieldAndToggles = false
    var body: some View {
        NavigationStack {
            ZStack {
                VStack{
                    HStack(alignment:.center){
                        Button {
                            
                        } label: {
                            Image(systemName: "chevron.left") // Back simgesi
                                .frame(width: 20, height: 20)
                                .foregroundColor(.black)
                                .padding(6)
                                .onTapGesture {
                                    dismiss()//butona tıklandıgında dısmıss gelıcek ve kapatılcak burası dismiss olacak yok edılcek
                                }
                        }
                        .modifier(buttonsmall())
                        Spacer()
                        
                        Button {
                            
                        } label: {
                            Image("Gedixx") // Back simgesi
                                .frame(width: 20, height: 20)
                                .foregroundColor(.black)
                                .padding(6)
                        }
                        .modifier(buttonsmall())
                        Button {
                            
                        } label: {
                            Image("LogOut") // Back simgesi
                                .frame(width: 20, height: 20)
                            
                            
                                .padding(6)
                        }
                        .modifier(buttonsmall())
                        
                        
                    }
                    .padding(.top)
                    .padding(.horizontal)
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
                            TextField("Telefon Numaranızı Giriniz" , text: $phoneNumber)
                                .modifier(textFieldText())
                                .font(
                                    Font.custom("Plus Jakarta Sans", size: 14)
                                        .weight(.medium)
                                )
                                .foregroundColor(Constants.LabelColorPrimary)
                                .keyboardType(.numberPad) // Sayısal klavye sağlar
                                .disabled(showTCFieldAndToggles) // Devam Et butonuna basıldığında pasif yapar
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
                    
                    // TCKN TextField'ı ve Toggle'lar
                    if showTCFieldAndToggles {
                        VStack {
                            HStack {
                                Image("usertc")
                                VStack {
                                    Text("TCKN")
                                        .modifier(textFieldTitle())
                                    TextField("1234567890", text: $tcNumber)
                                        .modifier(textFieldText())
                                        .keyboardType(.numberPad) // Sayısal klavye sağlar
                                }
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
                        )
                        .padding(.horizontal)
                        
                        Toggle(isOn: $permission) {
                            Text("Gedik Yatırım ürün, hizmet, kampanya ve duyurulardan haberdar olmak elektronik iletilere izin veriyorum")
                                .font(
                                    Font.custom("Plus Jakarta Sans", size: 11)
                                        .weight(.semibold)
                                )
                                .foregroundColor(Constants.LabelColorSecondary)
//                                .frame(width: 286, alignment: .topLeading)
                        }
                        .toggleStyle(SwitchToggleStyle(tint: Color.blue))
                        .padding()
                        .padding(.horizontal)
                        
                        Toggle(isOn: $permission2) {
                            Text("Açık Rıza Metni ")
                                .font(Font.custom("Plus Jakarta Sans", size: 12)
                                    .weight(.semibold)) +
                            Text(" şartları okudum onaylıyorum")
                                .font(Font.custom("Plus Jakarta Sans", size: 12))
                                .foregroundColor(Constants.LabelColorSecondary)
                                
                        }
                        .frame(maxWidth: .infinity)
                        
                        .toggleStyle(SwitchToggleStyle(tint: Color.blue))
                        .padding()
                        .padding(.horizontal)
                    }
                    
                    Spacer()
                    NavigationLink {
                        Webview()
                            .navigationBarBackButtonHidden()
                        
                    } label: {
                        Text("KVKK Bildirimine ve Gizlilik Politikamıza\nburadan ulaşabilirsiniz")
                            .font(Font.custom("Plus Jakarta Sans", size: 13))
                            .underline()//yazının altını çiziyor
                            .multilineTextAlignment(.center)
                            .foregroundColor(Constants.FillColorFillColor600)
                            .padding(.bottom,16)
                    }
                    
                    if showTCFieldAndToggles {
                        NavigationLink {
                            SignUp_2()
                                .navigationBarBackButtonHidden()
                        } label: {
                            Text("Devam Et")
                                .modifier(buttonBlue())
                        }

                    }else{
                        Button {
                            showTCFieldAndToggles = true
                        } label: {
                            Text("Devam Et")
                                .modifier(buttonBlue())
                        }

                    }
                }
            }
            .background(Constants.BackgroundPrimary)
        }
        
    }
}

#Preview {
    SignUp_1_2()
}
