//
//  ComplianceTest .swift
//  gedik_yatirim
//
//  Created by Hasan on 19.08.2024.
//

import SwiftUI

struct ComplianceTest_: View {
    @State var currentStep : Int = 3
     
    var body: some View {
        ZStack{
            VStack{
                CustomHeader( title: "Uygunluk Testi")
                ExtractedViewBar(currentStep: $currentStep, textaciklama: "Hesap açılışınız sonrasında yatırım işlemlerinizi yapabilmeniz için şimdi uygunluk testini yapmak ister misiniz?")
                Image("Compliance")
                    .padding(.bottom)
                
                
            }
        }
    }
}

#Preview {
    ComplianceTest_()
}
