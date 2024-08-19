//
//  ComplianceTest .swift
//  gedik_yatirim
//
//  Created by Hasan on 19.08.2024.
//

import SwiftUI

struct ComplianceTest: View {
    @State var currentStep : Int = 3
     
    var body: some View {
        ZStack{
            VStack{
                CustomHeader( title: "Uygunluk Testi    ")
                ExtractedViewBar(currentStep: $currentStep, textaciklama: "Hesap açılışınız sonrasında yatırım işlemlerinizi yapabilmeniz için şimdi uygunluk testini yapmak ister misiniz?")
                Image("Compliance")
                    .padding(.top,33)
                
                Spacer()
                NavigationLink {
                    
                } label: {
                    Text("Başla")
                        .modifier(buttonBlue())
                }
                NavigationLink {
                    
                } label: {
                    Text("Testi Sonra Yap")
                        .modifier(buttonWhite())
                }


               
                
            }
        }
        .background(Constants.BackgroundPrimary)
    }
}

#Preview {
    ComplianceTest()
}
