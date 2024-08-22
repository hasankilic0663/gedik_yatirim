//
//  SuitabilityTest4.swift
//  gedik_yatirim
//
//  Created by Hasan on 20.08.2024.
//

import SwiftUI

struct SuitabilityTest6: View {
    @State var currentStep : Int = 3
    let riskGroups = ["Çok Düşük Riskli", "Düşük Riskli", "Orta Riskli", "Yüksek Riskli", "Çok Yüksek Riskli"]
    let optionse = [" ₺1\n₺50000 ", "₺50001 ₺500000",  "₺500001 ve üzeri"]
    
    
    var body: some View {
       
        ZStack {
            Constants.BackgroundPrimary
                .ignoresSafeArea()
            VStack{
                    CustomHeader(title: "Uygunluk Testi   ")
                    ExtractedViewBar(currentStep: $currentStep, textaciklama: "Yatırımlarınızı Ne Kadar Süreyle Değerlendirmeyi Planlıyorsunuz?")
                        
                    ExtractedGroupList(riskGroups: riskGroups, options: optionse)
                        
                    Spacer()
                    
                    NavigationLink {
                        SuitabilityTest7()
                            .navigationBarBackButtonHidden()
                    } label: {
                        Text("Devam Et")
                            .modifier(buttonBlue())
                        
                    }
                    

            }
        }
        }
    
}

#Preview {
    SuitabilityTest6()
}
