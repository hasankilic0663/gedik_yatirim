//
//  PersonInf_2.swift
//  gedik_yatirim
//
//  Created by Hasan on 12.08.2024.
//

import SwiftUI

struct PersonInf_2: View {
    @Environment(\.dismiss) var  dismiss
    var body: some View {
        ZStack{
            
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
                    Text("Kişisel Bilgileriniz")
                        .font(
                        Font.custom("Plus Jakarta Sans", size: 17)
                        .weight(.semibold)
                        )
                        .multilineTextAlignment(.center)
                        .foregroundColor(Constants.FillColorFillColor600)
                        .padding(.trailing,35)
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
                
                Spacer()
            }
        }
        .background(Constants.BackgroundPrimary)
        
        
    }
}

#Preview {
    PersonInf_2()
}
