//
//  LogIn.swift
//  gedik_yatirim
//
//  Created by Hasan on 4.08.2024.
//

import SwiftUI

struct LogIn: View {
    
    
    func bindingFromFocusState(_ focusBinding: FocusState<Bool>.Binding) -> Binding<Bool> {
        Binding(
            get: { focusBinding.wrappedValue },
            set: { focusBinding.wrappedValue = $0 }
        )
    }
    
    @State var password = ""
    @State var permission : Bool = false
    @State private var tcKimlikNumarasi = ""
    @FocusState  var isFocused : Bool // Odak durumunu izlemek için
    @FocusState  var tcisFocused : Bool
    var body: some View {
        ZStack {
            
            VStack{
                Image("Logo")
                    .padding(.top,82)
                Text("Hesabınıza Giriş Yapın")
                    .modifier(gedik_text_black())
                    .padding(10)
                    .frame(height: 64, alignment: .center)
               
                    VStack{
                        HStack{
                            Image("usertc")
                            VStack{
                                Text("TCKN")
                                    .modifier(textFieldTitle())
                                    .padding(.top,2)
                                TextField("1234567890" , text: $tcKimlikNumarasi)
                                    .font(
                                        Font.custom("Plus Jakarta Sans", size: 14)
                                            .weight(.medium)
                                    )
                                    .foregroundColor(Constants.LabelColorPrimary)

                                    .keyboardType(.numberPad) // Sayısal klavye sağlar
                                    .focused($isFocused) // Odak durumunu takip eder
                                    .onChange(of: tcKimlikNumarasi) { _ in
                                        // Harfleri ve özel karakterleri filtrele
                                        let filtered = tcKimlikNumarasi.filter { "0123456789".contains($0) }
                                        // Karakter sayısını 11 ile sınırla
                                        if filtered.count <= 11 {
                                            tcKimlikNumarasi = filtered
                                        } else {
                                            tcKimlikNumarasi = String(filtered.prefix(11))
                                        }
                                    }
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
                        .stroke(isFocused ? Color.blue : Constants.GreyGrey300, lineWidth: 1)
                ).padding(.horizontal)
                
                
                
                SecureFieldWithButton(text: $password, "********", bindingFromFocusState($tcisFocused))
                    .focused($tcisFocused)
                   
                
                    .padding(.top,3)
                
                
                Toggle(isOn: $permission)
                    {
                    Text("Beni Hatırla")
                        .font(
                        Font.custom("Plus Jakarta Sans", size: 14)
                        .weight(.semibold)
                        )
                        .multilineTextAlignment(.center)
                        .foregroundColor(Constants.LabelColorPrimary)
                }
                    .toggleStyle(SwitchToggleStyle(tint: Color.blue))
                .padding()
                .padding(.horizontal, 8)
                
                Button {
                    
                } label: {
                    Text("Giriş Yap")
                        .modifier(buttonBlue())
                }
                Button {
                } label: {
                    Text("Şifre Al / Unuttum")
                        .padding(.horizontal, 12)
                        .padding(.vertical, 10)
                        .frame(height: 40, alignment: .center)
                        .cornerRadius(10)
                        .font(
                        Font.custom("Plus Jakarta Sans", size: 14)
                        .weight(.semibold))
                        .foregroundColor(Constants.LabelColorPrimary)
                }.padding(.top,10)


                
                Spacer()
                HStack{
                    Text("Bir hesabınız yok mu?")
                    .font(
                    Font.custom("Plus Jakarta Sans", size: 13)
                    .weight(.medium)
                    )
                    .multilineTextAlignment(.center)
                    .foregroundColor(Constants.LabelColorSecondary)
                    
                    NavigationLink {
                        SignUp_1()
                            .navigationBarBackButtonHidden()
                    } label: {
                        Text("Hesap oluştur")
                            .font(
                            Font.custom("Plus Jakarta Sans", size: 13)
                            .weight(.semibold)
                            )
                            .foregroundColor(Constants.LabelColorPrimary)
                    }

                }
                .padding(.horizontal, 8)
                .padding(.vertical, 10)
                .frame(height: 32, alignment: .center)
                .cornerRadius(8)
            }
            .padding(.bottom)
        }
        .background(Constants.BackgroundPrimary)
    }
}

#Preview {
    LogIn()
}
