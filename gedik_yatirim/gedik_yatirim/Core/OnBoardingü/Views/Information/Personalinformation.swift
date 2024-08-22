//
//  Personalinformation.swift
//  gedik_yatirim
//
//  Created by Hasan on 5.08.2024.
//

import SwiftUI

struct Personalinformation: View {
    @State private var firstName: String = ""
    @State private var lastName: String = ""
    @State private var birthDate: String = ""
    @State private var email: String = ""
    @State private var currentStep: Int = 1
    private let totalSteps: Int = 5
    var body: some View {
        ZStack {
            VStack{
               CustomHeader(title: "Kişisel Bilgileriniz")
                HStack(alignment: .center,spacing: 2) {
                                ForEach(1...totalSteps, id: \.self) { step in
                                    Rectangle()
                                        .fill(step <= currentStep ? Color.blue : Color.gray.opacity(0.3))
                                        .frame(width: 36, height: 5, alignment: .leading)
                                        .cornerRadius(2.5)
//                                        .padding(.horizontal,0)
                                }
                            }
                .padding()
                
                Text("\(currentStep)/\(totalSteps)")
                    .font(
                    Font.custom("Plus Jakarta Sans", size: 17)
                    .weight(.semibold)
                    )
                    .multilineTextAlignment(.center)
                    .foregroundColor(Constants.FillColorFillColor600)
                
                Text("Sizi daha yakından tanıyabilmemiz ve ihtiyaçlarınıza özel çözümler sunabilmemiz için lütfen kişisel bilgilerinizi bizimle paylaşın.")
                .font(
                Font.custom("Plus Jakarta Sans", size: 15)
                .weight(.semibold)
                )
                .multilineTextAlignment(.center)
                .foregroundColor(Constants.LabelColorPrimary)
                .frame(width: 345, alignment: .top)
                .padding(.top,5)
                
                VStack{
                    Text("Adınız")
                        .modifier(textFieldTitle())
                    TextField("Ahmet" , text: $firstName)
                        .modifier(textFieldText())
                        .font(
                        Font.custom("Plus Jakarta Sans", size: 14)
                        .weight(.medium)
                        )
                        .foregroundColor(Constants.LabelColorPrimary)
                        // Sayısal klavye sağlar
                }
                .modifier(textFieldBox())
                .padding(.top)
                VStack{
                    Text("Soyadınız")
                        .modifier(textFieldTitle())
                    TextField("Soyadınızı Giriniz" , text: $lastName)
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
                            TextField("GG/AA/YY" , text: $birthDate)
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
                    TextField("email@ adres.com" , text: $email)
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
                    
                    
//                    PersonInf_2()
                    denemeperson()
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
