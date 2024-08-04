//
//  LogIn.swift
//  gedik_yatirim
//
//  Created by Hasan on 4.08.2024.
//

import SwiftUI

struct LogIn: View {
    @State private var tcNumber = ""
    @State var password = ""
    @State var permission : Bool = false
    @FocusState  var isFocused : Bool // Odak durumunu izlemek için
    var body: some View {
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
                            TextField("1234567890" , text: $tcNumber)
                                .font(
                                    Font.custom("Plus Jakarta Sans", size: 14)
                                        .weight(.medium)
                                )
                                .foregroundColor(Constants.LabelColorPrimary)
                                .keyboardType(.numberPad) // Sayısal klavye sağlar
                                .focused($isFocused) // Odak durumunu takip eder
                            
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
            
            
            
           SecureFieldWithButton(text: $password, "********")
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
            }


            
            Spacer()
        }
    }
}

#Preview {
    LogIn()
}
