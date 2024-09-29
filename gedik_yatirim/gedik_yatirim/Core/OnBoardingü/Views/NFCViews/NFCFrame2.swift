//
//  NFCFrame2.swift
//  gedik_yatirim
//
//  Created by Hasan on 29.09.2024.
//

import SwiftUI


struct NFCFrame2: View {
    var body: some View {
        @State var currentStep : Int = 5
        ZStack{
            Constants.BackgroundPrimary
                .ignoresSafeArea()
            
            VStack{
                CustomHeader(title: "Kimlik Doğrulama")
                ExtractedViewBar(currentStep: $currentStep, textaciklama: "Kimlik kartınızdaki biyometrik çip verileri okutulacaktır." )
                Image("nfcFrame2")
                
                HStack(spacing: 2) {
                    Constants.OrangeOrange200
                        .frame(width: 40, height: 9)
                        .cornerRadius(3)
                            
                    Constants.OrangeOrange300
                        .frame(width: 40, height: 9)
                                .cornerRadius(3)
                            
                    Constants.OrangeOrange400
                        .frame(width: 40, height: 9)
                                .cornerRadius(3)
                            
                    Constants.OrangeOrange500
                                .frame(width: 40, height: 9)
                                .cornerRadius(3)
                            
                    Constants.OrangeOrange600
                        .frame(width: 40, height: 9)
                        .cornerRadius(3)
                    Constants.OrangeOrange600
                        .frame(width: 40, height: 9)
                        .cornerRadius(3)
                        }
                        .padding()
                        
                        .cornerRadius(5)
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
    NFCFrame2()
}
