//
//  Splash.swift
//  gedik_yatirim
//
//  Created by Hasan on 1.08.2024.
//

import SwiftUI

struct Splash: View {
    var body: some View {
        ZStack {
            AppColors.backgroundColor
                .ignoresSafeArea()
           
            ZStack{
                Image("gedik")
            }
            .frame(width: 298,height: 40)
            VStack{
             
                Spacer()
                Text("Bu uygulamanın verileri Matriks Bilgi Dağıtım Hizmetleri A.Ş. tarafından sağlanmaktadır.")
                    .font(
                        Font.custom("Plus Jakarta Sans", size: 12)
                            .weight(.medium)
                    )
                    .multilineTextAlignment(.center)
                    .foregroundColor(Constants.ShadesWhite)
                    .padding(.horizontal)
                
                    
            }.padding(.bottom, 40)
//            .padding(.horizontal, 47)
//
//            .padding(.top, 406)
//
//            .padding(.bottom, 68)
//
//            .frame(width: 393, alignment: .bottomLeading)
            
//            HStack(alignment: .center, spacing: 0) { Text("sadas")}
//            .padding(.horizontal, 127)
//            .padding(.vertical, 0)
//            .frame(width: 393, height: 21, alignment: .center)
        }
    }
}



#Preview {
    Splash()
}
