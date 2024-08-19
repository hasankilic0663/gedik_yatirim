//
//  SuitabilityTest1.swift
//  gedik_yatirim
//
//  Created by Hasan on 19.08.2024.
//

import SwiftUI

struct SuitabilityTest1: View {
    @State var currentStep : Int = 3
    var egitim  = ["İlköğretim / Ortaöğretim","Lise","Lisans ve üstü"]
    @State var selectedOption: String? = nil
   
    var body: some View {
        
        ZStack{
            VStack{
                CustomHeader( title: "Uygunluk Testi     "  )
                // dolum barı
                ExtractedViewBar(currentStep: $currentStep, textaciklama: "Eğitim Bilginiz?")
                    .padding(.bottom)
                ExtractedList(selectedOption: $selectedOption , array: egitim)

                Spacer()
                NavigationLink {
                    SuitabilityTest2()
                        .navigationBarBackButtonHidden()
                } label: {
                    Text("Devam Et")
                        .modifier(buttonBlue())
                        .padding(.bottom)
                }

//                .padding(4)
//              .frame(width: 377, height: 200 , alignment: .top)
////                .frame(height : CGFloat(dizi.count * 68))
//                .background(Constants.BackgroundSecondary)
//                .cornerRadius(12)
//                .overlay(
//                    RoundedRectangle(cornerRadius: 12)
//                        .inset(by: 0.5)
//                        .stroke(Constants.GreyGrey200, lineWidth: 1)
//                )
//                .padding(.horizontal,3)
//                Spacer()
               
            }
        }
        .background(Constants.BackgroundPrimary)
    }
}

#Preview {
    SuitabilityTest1()
}
