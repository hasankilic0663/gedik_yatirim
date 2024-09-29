//
//  FaceRecognition.swift
//  gedik_yatirim
//
//  Created by Hasan on 29.09.2024.
//

import SwiftUI

struct FaceRecognition: View {
    @State var currentStep : Int = 5
    var body: some View {
        ZStack{
            Constants.BackgroundPrimary
                .ignoresSafeArea()
            VStack{
                CustomHeader(title: "Yüz Tanıma        ")
                ExtractedViewBar(currentStep: $currentStep, textaciklama: "Bilgileriniz başarılı bir şekilde okundu. Yüz tanıma için aydınlık ve güvenli bir ortama geçiniz.  " )
                
                Image("nfcFace")
                
                Spacer()
                
                NavigationLink {
                    
                } label: {
                    Text("Devam Et")
                        .modifier(buttonBlue())
                        .padding(.bottom)
                }

            }
        }
    }
}

#Preview {
    FaceRecognition()
}
