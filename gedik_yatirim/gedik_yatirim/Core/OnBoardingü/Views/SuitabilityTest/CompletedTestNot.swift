//
//  CompletedTestNot.swift
//  gedik_yatirim
//
//  Created by Hasan on 20.08.2024.
//

import SwiftUI

protocol AnyDestination : View {
    
}
struct CompletedTestNot: AnyDestination{
    @Environment(\.dismiss) var  dismiss
    var body: some View {
        ZStack{
            Constants.BackgroundPrimary
                .ignoresSafeArea()
            VStack{
                Spacer()
                Text("Henüz Testi Tamamlamadınız!")
                    .modifier(gedik_text_Blue_semibold())
                    .padding(.bottom)
                Text("Sürecinizi tamamlamanıza çok az kaldı. Yine de çıkış yapmak istiyor musunuz?")
                    .modifier(gedik_textBlackAciklama())
                    .padding(.bottom)
                Image("completedTestNot")
                Spacer()
                
                Button {
                    dismiss()//butona tıklandıgında dısmıss gelıcek ve kapatılcak burası dismiss olacak yok edılcek
                } label: {
                    Text("Devam Et")
                        .modifier(buttonBlue())
                }
                NavigationLink {
                    
                } label: {
                    Text("Çıkış Yap")
                        .modifier(buttonWhite())
                }
             
            }
        }
        .navigationBarBackButtonHidden()
       
        
    }
}

#Preview {
    CompletedTestNot()
}
