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
                        .modifier(textFieldTextPerson(errortext: viewModel.errorActive , errortextfield: viewModel.firstName.isEmpty ))
                        .font(
                        Font.custom("Plus Jakarta Sans", size: 14)
                        .weight(.medium)
                        )
                        .foregroundColor(Constants.LabelColorPrimary)
                        // Sayısal klavye sağlar
                }
                .modifier(textFieldBoxPerson(error: viewModel.errorActive && viewModel.firstName.isEmpty))
//                .padding(.top)
                VStack{
                    Text("Soyadınız")
                        .modifier(textFieldTitle())
                    TextField("Soyadınızı Giriniz" , text: $viewModel.lastName)
                        .modifier(textFieldTextPerson(errortext: viewModel.lastName.isEmpty,  errortextfield: viewModel.errorActive))
                        .font(
                        Font.custom("Plus Jakarta Sans", size: 14)
                        .weight(.medium)
                        )
                        .foregroundColor(Constants.LabelColorPrimary)
                       
                }
                .modifier(textFieldBoxPerson(error: viewModel.errorActive && viewModel.lastName.isEmpty))
                
                
                    HStack{
                        VStack{
                            Text("Doğum Tarihi")
                                .modifier(textFieldTitle())
                            TextField("GG/AA/YY" , text: $viewModel.birthDate)
                                .modifier(textFieldTextPerson(errortext: viewModel.errorActive, errortextfield: viewModel.birthDate.isEmpty))
                                .font(
                                    Font.custom("Plus Jakarta Sans", size: 14)
                                        .weight(.medium)
                                )
                                .foregroundColor(Constants.LabelColorPrimary)
                                .keyboardType(.numberPad) // Sayısal klavye sağlar
                        }
                        Image("Date")
                    }
                
                .modifier(textFieldBoxPerson(error: viewModel.errorActive && viewModel.birthDate.isEmpty))
                VStack{
                    Text("Email")
                        .modifier(textFieldTitle())
                    TextField("email@ adres.com" , text: $viewModel.email)
                        .modifier(textFieldTextPerson(errortext: viewModel.errorActive, errortextfield: viewModel.email.isEmpty))
                        .font(
                        Font.custom("Plus Jakarta Sans", size: 14)
                        .weight(.medium)
                        )
                        .foregroundColor(Constants.LabelColorPrimary)
                         //r
                }
                .modifier(textFieldBoxPerson(error: viewModel.errorActive && viewModel.email.isEmpty))
                if !viewModel.errorMessage.isEmpty{
                    // Default/Medium/Label Large
                    Text(viewModel.errorMessage)
                        .modifier(errorMessageText())
                }
                
            
                
                Spacer()
                
                NavigationLink(destination : PersonInf_2(), isActive: $viewModel.errorActive) {
                    
                    Button{
                        viewModel.validationPerson()
                           
                    } label: {
                        Text("Devam Et")
                            .modifier(buttonBlue())
                        
                    }
                }
                .navigationBarBackButtonHidden()

            }
            .padding(.bottom)
        }
        .background(Constants.BackgroundPrimary)
    }
}

#Preview {
    Personalinformation()
}
