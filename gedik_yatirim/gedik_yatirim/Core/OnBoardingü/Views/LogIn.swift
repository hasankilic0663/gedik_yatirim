//
//  LogIn.swift
//  gedik_yatirim
//
//  Created by Hasan on 4.08.2024.
//

import SwiftUI

struct LogIn: View {
    
    
   
    @Environment(\.dismiss) var dismiss
//    @State var password = ""
    @StateObject var viewModel = LogInViewModel()
    @State var permission : Bool = false
//    @State private var tcKimlikNumarasi = ""
    @FocusState  var isFocused : Bool
    @FocusState  var tcisFocused : Bool
    var body: some View {
        ZStack {
            
            VStack{
                HStack{
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
                }
                .padding(.top,0)
                .padding(.horizontal)
                Image("Logo")
                    .padding(.top,52)
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
                                TextField("1234567890" , text: $viewModel.tckn)
                                    .font(
                                        Font.custom("Plus Jakarta Sans", size: 14)
                                            .weight(.medium)
                                    )
                                    .foregroundColor(Constants.LabelColorPrimary)

                                    .keyboardType(.numberPad) // Sayısal klavye sağlar
                                    .focused($isFocused) // Odak durumunu takip eder
                                    .onChange(of: viewModel.tckn) { _ in

                                        viewModel.filter()
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
               
                 
                SecureFieldWithButton(text: $viewModel.password, "********",isfocused: tcisFocused)
                    .focused($tcisFocused)
                   
                
                    .padding(.top,3)
            if !viewModel.errorMessage.isEmpty{
                // Default/Medium/Label Large
                Text("TCKN veya Şifrenizi Yanlış Girdiniz")
                    .modifier(errorMessageText())
            }
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
                    viewModel.login()
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
        .onTapGesture { //ekranda farklı boş yeere tıklayınca kapanıyor klavye
                    UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
                }
    }
}

#Preview {
    LogIn()
}
