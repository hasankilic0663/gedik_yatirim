//
//  SuitabilityTest4.swift
//  gedik_yatirim
//
//  Created by Hasan on 20.08.2024.
//

import SwiftUI

struct SuitabilityTest5: View {
    @State var currentStep : Int = 3
    let riskGroups = ["Çok Düşük Riskli", "Düşük Riskli", "Orta Riskli", "Yüksek Riskli", "Çok Yüksek Riskli"]
    let optionse = ["Yılda Birkaç Defa", "Ayda Birkaç Defa",  "Haftada Birkaç Defa"]
    
    
    var body: some View {
       
        ZStack {
            Constants.BackgroundPrimary
                .ignoresSafeArea()
            VStack{
                    CustomHeader(title: "Uygunluk Testi   ", logoutDestination: AnyView(CompletedTestNot()))
                    ExtractedViewBar(currentStep: $currentStep, textaciklama: "Yatırımlarınızı Ne Kadar Süreyle Değerlendirmeyi Planlıyorsunuz?")
                        
                    ExtractedGroupList(riskGroups: riskGroups, options: optionse)
                        
                    Spacer()
                    
                    NavigationLink {
                        SuitabilityTest6()
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
    SuitabilityTest5()
}
