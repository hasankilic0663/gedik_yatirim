//
//  SuitabilityTest3.swift
//  gedik_yatirim
//
//  Created by Hasan on 19.08.2024.
//

import SwiftUI

struct SuitabilityTest3: View {
    @State var currentStep : Int = 3
    @State var selectedOption: String? = nil
    var tercih = ["Anaparam aynen korunsun isterim","Ana paramdan çok az miktar kaybetmeyi göze alabilirim.","Ana paradan sadece bir miktar kaybetmeyi göze alabilirim.","Ana paradan kaybetmeyi göze alabilirim.","Ana paramı tamamen kaybetmeyi göze alabilirim."]
    var body: some View {
        ZStack {
            VStack {
                CustomHeader(title: "Uygunluk Testi   ")
                ExtractedViewBar(currentStep: $currentStep, textaciklama: "Yatırımlarınızı Ne Kadar Süreyle Değerlendirmeyi Planlıyorsunuz?")
                ExtractedList(selectedOption: $selectedOption, radiobutton: true , array: tercih)
                
                Spacer()
                NavigationLink {
                    SuitabilityTest4()
                        .navigationBarBackButtonHidden()
                } label: {
                    Text("Devam Et")
                        .modifier(buttonBlue())
                        .padding(.bottom)
                }

            }
        } .background(Constants.BackgroundPrimary)
    }
}

#Preview {
    SuitabilityTest3()
}
