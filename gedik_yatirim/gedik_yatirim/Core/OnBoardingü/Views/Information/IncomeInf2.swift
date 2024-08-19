//
//  IncomeInf2.swift
//  gedik_yatirim
//
//  Created by Hasan on 19.08.2024.
//

import SwiftUI

struct IncomeInf2: View {
    @State var currentStep : Int = 2
    @State var isSheetNema : Bool = false 
    @State var isSheetEkstre : Bool = false
    @State var nematext = "İstiyorum"
    @State var ekstreText = "Posta"
    @State var textIban = ""
    
    
    var body: some View {
        ZStack{
            VStack{
                CustomHeader(title: "Gelir Bilgileriniz")
                ExtractedViewBar(currentStep: $currentStep, textaciklama: "Nema, yatırımcının alacak bakiyesinde kalan paranın faiz  getirisi ile değerlendirilmesidir.")
                    .padding(.bottom)
                ButtonSheet(isSheetPresendet: $isSheetNema, textAuto: nematext , title: "Nema")
                ButtonSheet(isSheetPresendet: $isSheetEkstre, textAuto: ekstreText , title: "Ekstre")
                Text("E-posta tercihiniz, kağıt israfını önler ve doğayı korur. Posta tercih ederseniz, ücretlendirme yapılacaktır.")
                    .modifier(gedikInfotext())
                    
                CustomTextField(inputText: textIban , title: "IBAN (Opsiyonel)", text: "TR__ ____ ____ ____ ____ ____ __")
                Text("Hesap açılış işlemleriniz sonrasında Hesabım Var alanından giriş yaparak düzenleme yapabilirsiniz.")
                    .modifier(gedikInfotext())
                Spacer()
            
                NavigationLink {
                    ComplianceTest()
                        .navigationBarBackButtonHidden()
                } label: {
                    Text("Devam Et")
                        .modifier(buttonBlue())
                }

            }
        }
        .background(Constants.BackgroundPrimary)
    }
}

#Preview {
    IncomeInf2()
}
