//
//  Personalinformation.swift
//  gedik_yatirim
//
//  Created by Hasan on 5.08.2024.
//

import SwiftUI

struct Personalinformation: View {
    @StateObject var viewModel = PersonInfViewModel()
    var body: some View {
        ZStack {
            VStack{
               CustomHeader(title: "Kişisel Bilgileriniz")
                ExtractedViewBar(currentStep: $viewModel.currentStep, textaciklama: "Sizi daha yakından tanıyabilmemiz ve ihtiyaçlarınıza özel çözümler sunabilmemiz için lütfen kişisel bilgilerinizi bizimle paylaşın.")
                VStack{
                    Text("Adınız")
                        .modifier(textFieldTitle())
                    TextField("Ahmet" , text: $viewModel.firstName)
                        .modifier(textFieldText())
                        .font(
                        Font.custom("Plus Jakarta Sans", size: 14)
                        .weight(.medium)
                        )
                        .foregroundColor(Constants.LabelColorPrimary)
                        // Sayısal klavye sağlar
                }
                .modifier(textFieldBox())
//                .padding(.top)
                VStack{
                    Text("Soyadınız")
                        .modifier(textFieldTitle())
                    TextField("Soyadınızı Giriniz" , text: $viewModel.lastName)
                        .modifier(textFieldText())
                        .font(
                        Font.custom("Plus Jakarta Sans", size: 14)
                        .weight(.medium)
                        )
                        .foregroundColor(Constants.LabelColorPrimary)
                       
                }
                .modifier(textFieldBox())
                
                
                    HStack{
                        VStack{
                            Text("Doğum Tarihi")
                                .modifier(textFieldTitle())
                            TextField("GG/AA/YY" , text: $viewModel.birthDate)
                                .modifier(textFieldText())
                                .font(
                                    Font.custom("Plus Jakarta Sans", size: 14)
                                        .weight(.medium)
                                )
                                .foregroundColor(Constants.LabelColorPrimary)
                                .keyboardType(.numberPad) // Sayısal klavye sağlar
                        }
                        Image("Date")
                    }
                
                .modifier(textFieldBox())
                VStack{
                    Text("Email")
                        .modifier(textFieldTitle())
                    TextField("email@ adres.com" , text: $viewModel.email)
                        .modifier(textFieldText())
                        .font(
                        Font.custom("Plus Jakarta Sans", size: 14)
                        .weight(.medium)
                        )
                        .foregroundColor(Constants.LabelColorPrimary)
                         //r
                }
                .modifier(textFieldBox())
                
            
                
                Spacer()
                
                NavigationLink {
//                    if currentStep < totalSteps {
//                                           currentStep += 1
//                                       }
                    
                    
                    PersonInf_2()
//                    denemeperson()
                    .navigationBarBackButtonHidden()
                } label: {
                    Text("Devam Et")
                        .modifier(buttonBlue())
                    
                }

            }
            .padding(.bottom)
        }
        .background(Constants.BackgroundPrimary)
    }
}

#Preview {
    Personalinformation()
}
