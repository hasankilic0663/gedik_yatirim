//
//  IncomeInformation.swift
//  gedik_yatirim
//
//  Created by Hasan on 15.08.2024.
//

import SwiftUI

struct IncomeInformation: View {
    @State var currentStep : Int = 2
  
    @State var isSheetPresendetmeslek : Bool = false
    @State var isSheetPresendetgelir : Bool = false
    @State var isSheetPresendetKaynak : Bool = false
    @State var isSheetPresendetBirikim : Bool = false
    var body: some View {
        ZStack{
            VStack{
                CustomHeader(title: "Kişisel Bilgileriniz")
                ExtractedViewBar(currentStep: $currentStep, textaciklama: "Toplam gelir bilgilerinizi eklemek, size uygun finansal çözümler sunmamıza yardımcı olacaktır.")
                    .padding(.bottom)
                ButtonSheet(isSheetPresendet: $isSheetPresendetmeslek, sehir: "Tasarımcı", title:"Mesleğiniz")
                ButtonSheet(isSheetPresendet: $isSheetPresendetgelir, sehir: "₺25.001 - ₺50.000 ", title:"Aylık Geliriniz")
                ButtonSheet(isSheetPresendet: $isSheetPresendetKaynak, sehir: "Maaş", title:"Kazanç Kaynağınız")
                ButtonSheet(isSheetPresendet: $isSheetPresendetBirikim, sehir: "₺0 - 150.0000", title:"Birikiminiz")
                Spacer()
                Button {
                    
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
    IncomeInformation()
}
