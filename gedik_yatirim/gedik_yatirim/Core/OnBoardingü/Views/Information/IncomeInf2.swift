//
//  IncomeInf2.swift
//  gedik_yatirim
//
//  Created by Hasan on 19.08.2024.
//

import SwiftUI

struct IncomeInf2: View {
    @StateObject var viewModel = IncomeInf_2ViewModel()
    var body: some View {
        ZStack{
            VStack{
                CustomHeader(title: "Gelir Bilgileriniz")
                ExtractedViewBar(currentStep: $viewModel.currentStep, textaciklama: "Nema, yatırımcının alacak bakiyesinde kalan paranın faiz  getirisi ile değerlendirilmesidir.")
                    .padding(.bottom)
                ButtonSheet(isSheetPresendet: $viewModel.isSheetNema, textAuto: viewModel.nemaText , title: "Nema")
                ButtonSheet(isSheetPresendet: $viewModel.isSheetEkstre, textAuto: viewModel.ekstreText , title: "Ekstre")
                Text("E-posta tercihiniz, kağıt israfını önler ve doğayı korur. Posta tercih ederseniz, ücretlendirme yapılacaktır.")
                    .modifier(gedikInfotext())
                    
                CustomTextField(inputText: viewModel.textIban , title: "IBAN (Opsiyonel)", text: "TR__ ____ ____ ____ ____ ____ __")
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
        
        .sheet(isPresented : $viewModel.isSheetNema){
ExtractedSheetSmall(selectedOption: $viewModel.selectedOption,
                selection: $viewModel.nemaText,
                title:  "Aylık Geliriniz",
                dizi: viewModel.nema,
                
                selected: $viewModel.selected,//değişti
                isSheetPresendet: $viewModel.isSheetNema,
                searchBool: false)
}
        .sheet(isPresented : $viewModel.isSheetEkstre){
ExtractedSheetSmall(selectedOption: $viewModel.selectedOption2,
                selection: $viewModel.ekstreText,
                title:  "Aylık Geliriniz",
                dizi: viewModel.ekstre,
                
                selected: $viewModel.selected,//değişti
                isSheetPresendet: $viewModel.isSheetEkstre,
                searchBool: false)
}

    }
}

#Preview {
    IncomeInf2()
}
