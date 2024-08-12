//
//  SignUp_2.swift
//  gedik_yatirim
//
//  Created by Hasan on 2.08.2024.
//

import SwiftUI

struct SignUp_2: View {
    
    @Environment(\.dismiss) var dismiss
    @State private var code = ["", "", "", "", "", ""]
    var body: some View {
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
            Text("Devam edebilmeniz için cep telefonunuza gönderdiğimiz doğrulama kodunu giriniz.")
                .modifier(gedik_text_black())
                .padding(10)
                .frame(height: 64, alignment: .center)
            
            HStack{
                ForEach(0..<code.count, id: \.self) { index in
                    TextField("", text: Binding(
                        get: { code[index] },
                        set: { code[index] = $0 }
                    ))
                    .modifier(textFieldSmallBox())
                }
            }
            
            
            
            
            Spacer()
            NavigationLink {
                Personalinformation()
                    .navigationBarBackButtonHidden()
            } label: {
                Text("Onayla")
                    .modifier(buttonBlue())
            }

//                .toolbar{
//                    ToolbarItem( placement: .topBarLeading) {
//                        Image(systemName: "chevron.left")
//                            .frame(width: 20, height: 20)
//                            .foregroundColor(.black)
//                            .padding(6)
//                            .modifier(buttonsmall())
//                            .onTapGesture {
//                                dismiss()//butona tıklandıgında dısmıss gelıcek ve kapatılcak burası dismiss olacak yok edılcek
//                            }
//                    }
//                }
        }
        .padding(.bottom)

        
        
    }
}

#Preview {
    SignUp_2()
}
