//
//  CustomHeader.swift
//  gedik_yatirim
//
//  Created by Hasan on 12.08.2024.
//

import SwiftUI

struct CustomHeader: View {
    @Environment(\.dismiss) var  dismiss
    var title : String = "" 
    var logoutDestination: AnyView? // Çıkış butonu için yönlendirme
  
    var body: some View {
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
            Text(title)
                .font(
                Font.custom("Plus Jakarta Sans", size: 17)
                .weight(.semibold)
                )
                .multilineTextAlignment(.center)
                .foregroundColor(Constants.FillColorFillColor600)
                .padding(.trailing,35)
            NavigationLink{
                logoutDestination
            } label: {
                Image("Gedixx") // Back simgesi
                    .frame(width: 20, height: 20)
                    .foregroundColor(.black)
                    .padding(6)
            }
            .modifier(buttonsmall())
            NavigationLink {
                logoutDestination
            } label: {
                Image("LogOut") // Back simgesi
                    .frame(width: 20, height: 20)
                    
                    
                    .padding(6)
            }
            .modifier(buttonsmall())

            
        }
        .padding(.top)
        .padding(.horizontal)

    }
}

#Preview {
    CustomHeader( logoutDestination: AnyView(Text("Çıkış Sayfası")) )
    
}
