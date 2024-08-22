//
//  SuitabilityTest8.swift
//  gedik_yatirim
//
//  Created by Hasan on 21.08.2024.
//

import SwiftUI

struct SuitabilityTest8: View {
    @State var currentStep : Int = 3
    var body: some View {
        ZStack{
            VStack{
                CustomHeader(title: "Uygunluk Testi")
                ExtractedViewBar(currentStep: $currentStep, textaciklama: "Risk Grubunuza Uygun Olan Ürünler")
                
                Spacer()
            }
        }
    }
}

#Preview {
    SuitabilityTest8()
}
