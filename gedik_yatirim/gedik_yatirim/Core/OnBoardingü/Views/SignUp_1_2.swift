//
//  SignUp-1.swift
//  gedik_yatirim
//
//  Created by Hasan on 2.08.2024.
//

import SwiftUI

struct SignUp_1_2: View {
    @Environment(\.dismiss) var dismiss
    @Binding  var phoneNumber : String
    @StateObject var viewModel = SignUp_1_2ViewModel()
//    @State private var permission = false
//    @State private var tcKimlikNumarasi = ""
//    @State private var permission2 = false

   
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
                        .background(Constants.GreyGrey100)
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
                                .disabled(true) // Devam Et butonuna basıldığında pasif yapar
                        }
                        .padding(.horizontal, 12)
                        .padding(.vertical, 8)
                        .frame(maxWidth: .infinity, minHeight: 58, maxHeight: 58, alignment: .topLeading)
                        .background(Constants.GreyGrey100)
                        .cornerRadius(8)
                        .overlay(
                            RoundedRectangle(cornerRadius: 8)
                                .inset(by: 0.5)
                                .stroke(Constants.GreyGrey300, lineWidth: 1)
                        ).padding(.trailing)
                    }
                    
                    // TCKN TextField'ı ve Toggle'lar
//                    if showTCFieldAndToggles {
                        VStack {
                            HStack {
                                Image("usertc")
                                VStack {
                                    Text("TCKN")
                                        .modifier(textFieldTitle())
                                    TextField("1234567890", text: $viewModel.tcKimlikNumarasi)
                                        .modifier(textFieldText())
                                        .keyboardType(.numberPad) // Sayısal klavye sağlar
                                        .onChange(of: viewModel.tcKimlikNumarasi) { _ in
                                            // Harfleri ve özel karakterleri filtrele
                                            let filtered = viewModel.tcKimlikNumarasi.filter { "0123456789".contains($0) }
                                            // Karakter sayısını 11 ile sınırla
                                            if filtered.count <= 11 {
                                                viewModel.tcKimlikNumarasi = filtered
                                            } else {
                                                viewModel.tcKimlikNumarasi = String(filtered.prefix(11))
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
                                .stroke(Constants.GreyGrey300, lineWidth: 1)
                        )
                        .padding(.horizontal)
                        
                    Toggle(isOn: $viewModel.permission) {
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
                        
                    Toggle(isOn: $viewModel.permission2) {
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
//                    }
                    
                    Spacer()
                    NavigationLink {
                        WebviewContainer()
                            .navigationBarBackButtonHidden()
                        
                    } label: {
                        Text("KVKK Bildirimine ve Gizlilik Politikamıza\nburadan ulaşabilirsiniz")
                            .font(Font.custom("Plus Jakarta Sans", size: 13))
                            .underline()//yazının altını çiziyor
                            .multilineTextAlignment(.center)
                            .foregroundColor(Constants.FillColorFillColor600)
                            .padding(.bottom,16)
                    }
                    
                    NavigationLink(destination: SignUp_2(), isActive: $viewModel.isNavigationActive) {
                        Button {
                            
                            viewModel.validate()
                            
                        } label: {
                            Text("Devam Et")
                                .modifier(buttonBlue())
                                .padding(.bottom)
                        }
                    }
                       
                    .navigationBarBackButtonHidden()

                    
                }
                .onAppear {
                            viewModel.phoneNumber = phoneNumber
                        }
                if viewModel.showAlert {
                    CustomAlertView2(viewModel: viewModel)
                    
                }
            }
            .background(Constants.BackgroundPrimary)
        }
        .navigationBarBackButtonHidden()
        
    }
}

#Preview {
    SignUp_1_2(phoneNumber : .constant(""))
}
struct CustomAlertView2: View {
    @ObservedObject var viewModel: SignUp_1_2ViewModel

    var body: some View {
        
            Color.black.opacity(0.3)
                .ignoresSafeArea()

            VStack(spacing: 13) {
                Text("Uyarı")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(.blue)
                    .padding(.top,12)

                Text(viewModel.alertMessage)
                    .fontWeight(.medium)
                    .multilineTextAlignment(.center)
                    .padding()

                Button(action: {
                    viewModel.showAlert = false
                }) {
                    Text("TAMAM")
                        .modifier(buttonBlueSheet())
                }
            }
            .padding()
            .background(Color.white)
            .cornerRadius(20)
            .shadow(radius: 10)
            .frame(maxWidth: 350)
            .padding()
        
    }
}
