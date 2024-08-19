//
//  SuitabilityTest1.swift
//  gedik_yatirim
//
//  Created by Hasan on 19.08.2024.
//

import SwiftUI

struct SuitabilityTest1: View {
    @State var currentStep : Int = 3
    
    var body: some View {
        
        ZStack{
            VStack{
                CustomHeader( title: "Uygunluk Testi     "  )
                // dolum barı
                ExtractedViewBar(currentStep: $currentStep, textaciklama: "Eğitim Bilginiz?")
               
            }
        }
    }
}

#Preview {
    SuitabilityTest1()
}
