//
//  WelcomeBack.swift
//  gedik_yatirim
//
//  Created by Hasan on 2.08.2024.
//

import SwiftUI

struct WelcomeBack: View {
    var body: some View {
        ZStack {
            VStack{
                Spacer()
                Text("Kayıtlı Bir Hesabınız Var!")
                    .modifier(gedik_text_Blue_semibold())
                    .padding()
                
                Text("Girmiş olduğunuz TCKN veya Telefon Numarası bilgileri ile oluşturulmuş hesabınız olduğunu görüntülüyoruz. Daha önceden bir kayıt oluşturmadıysanız lütfen bizimle iletişime geçin.")
                    .modifier(gedik_textBlackAciklama())
                VStack(alignment: .center, spacing: 10){
                    Image("SOSMEDVERIFIEDACCOUNT3")
                }
                .padding(0)
                .frame(width: 320, height: 320, alignment: .center)
                
                Spacer()
                Button {
                    
                } label: {
                    Text("Ara")
                        .modifier(buttonBlue())
                }
                Button {
                    
                } label: {
                    Text("Giriş Yap")
                        .modifier(buttonStroke())
                    
                }
                
            }
            .padding(.bottom)
        }
        .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
        .background(Constants.BackgroundPrimary)
        
        
    }
}

#Preview {
    WelcomeBack()
}
