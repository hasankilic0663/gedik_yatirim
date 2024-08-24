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
                        .modifier(textFieldTextPerson(errortext: viewModel.errorActive[0] ))
                        .font(
                        Font.custom("Plus Jakarta Sans", size: 14)
                        .weight(.medium)
                        )
                        .foregroundColor(Constants.LabelColorPrimary)
                        // Sayısal klavye sağlar
                }
                .modifier(textFieldBoxPerson(error: viewModel.errorActive[0]))
                if viewModel.errorActive[0]{
                    // Default/Medium/Label Large
                    Text(viewModel.errorMessage[0])
                        .modifier(errorMessageText())
                }
//                .padding(.top)
                VStack{
                    Text("Soyadınız")
                        .modifier(textFieldTitle())
                    TextField("Soyadınızı Giriniz" , text: $viewModel.lastName)
                        .modifier(textFieldTextPerson(errortext: viewModel.errorActive[1]))
                        .font(
                        Font.custom("Plus Jakarta Sans", size: 14)
                        .weight(.medium)
                        )
                        .foregroundColor(Constants.LabelColorPrimary)
                       
                }
                .modifier(textFieldBoxPerson(error: viewModel.errorActive[1]))
                if viewModel.errorActive[1]{
                    // Default/Medium/Label Large
                    Text(viewModel.errorMessage[1])
                        .modifier(errorMessageText())
                }
                
                
                    HStack{
                        VStack{
                            Text("Doğum Tarihi")
                                .modifier(textFieldTitle())
                            TextField("GG/AA/YY" , text: $viewModel.birthDate)
                                .modifier(textFieldTextPerson(errortext: viewModel.errorActive[2]))
                                .font(
                                    Font.custom("Plus Jakarta Sans", size: 14)
                                        .weight(.medium)
                                )
                                .foregroundColor(Constants.LabelColorPrimary)
                                
                        }
                        Image("Date")
                    }
                
                .modifier(textFieldBoxPerson(error: viewModel.errorActive[2]))
                if viewModel.errorActive[2]{
                    // Default/Medium/Label Large
                    Text(viewModel.errorMessage[2])
                        .modifier(errorMessageText())
                }
                VStack{
                    Text("Email")
                        .modifier(textFieldTitle())
                    TextField("email@ adres.com" , text: $viewModel.email)
                        .modifier(textFieldTextPerson(errortext: viewModel.errorActive[3]))
                        .font(
                        Font.custom("Plus Jakarta Sans", size: 14)
                        .weight(.medium)
                        )
                        .foregroundColor(Constants.LabelColorPrimary)
                         //r
                }
                .modifier(textFieldBoxPerson(error: viewModel.errorActive[3]))
                if viewModel.errorActive[3]{
                    // Default/Medium/Label Large
                    Text(viewModel.errorMessage[3])
                        .modifier(errorMessageText())
                }
            
                
                Spacer()
                
                NavigationLink(destination : PersonInf_2(), isActive:.constant(!viewModel.errorActive.contains(true))) {
                    
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
        .navigationBarBackButtonHidden()
        .background(Constants.BackgroundPrimary)
    }
}

#Preview {
    Personalinformation()
}
