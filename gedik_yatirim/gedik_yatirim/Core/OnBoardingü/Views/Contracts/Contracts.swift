//
//  Contracts.swift
//  gedik_yatirim
//
//  Created by Hasan on 21.08.2024.
//

import SwiftUI

struct Contracts: View {
    @State var currentStep : Int = 4
    @State var selectedOption: Bool = false
    @State var selectedOption2: Bool = false
    
    var body: some View {
        ZStack{
            Constants.BackgroundPrimary
                .ignoresSafeArea(.all)
            VStack{
                CustomHeader(title: "Sözleşmeler")
                ExtractedViewBar(currentStep: $currentStep, textaciklama: "Sözleşmeleri okuyup onaylayarak kimlik doğrulama adımına geçebilirsiniz.")
                
                VStack(alignment: .center, spacing: 4) {
                    HStack(alignment: .center, spacing: 16) {
                    
                        Text("Risk Bildirim Formları")
                        .font(
                        Font.custom("Plus Jakarta Sans", size: 13)
                        .weight(.semibold)
                        )
                        .foregroundColor(Constants.LabelColorPrimary)
                        .frame(maxWidth: .infinity, alignment: .topLeading)
                        
                            Image( selectedOption ? "Checkboxfill" : "Checkbox") //
                            .onTapGesture {
                                selectedOption.toggle()
                            }

                       
                    }
                    .padding(.horizontal, 12)
                    .padding(.vertical, 8)
                    .frame(maxWidth: .infinity, minHeight: 48, maxHeight: 48, alignment: .leading)
                    .cornerRadius(4)
                    Rectangle()
                        .foregroundColor(.clear)
                        .frame(width: 340, height: 1)

                        .background(Constants.GreyGrey100)
                    
                        
                    HStack(alignment: .center, spacing: 16) {
                        Text("Kullanıcı Sözleşmeleri")
                        .font(
                        Font.custom("Plus Jakarta Sans", size: 13)
                        .weight(.semibold)
                        )
                        .foregroundColor(Constants.LabelColorPrimary)
                        .frame(maxWidth: .infinity, alignment: .topLeading)
                        Image( selectedOption2 ? "Checkboxfill" : "Checkbox")
                            .onTapGesture {
                                selectedOption2.toggle()
                            }//
                    }
                    .padding(.horizontal, 12)
                    .padding(.vertical, 8)
                    .frame(maxWidth: .infinity, minHeight: 48, maxHeight: 48, alignment: .leading)
                    .cornerRadius(4)
                }
                .padding(.horizontal, 0)

                .padding(.top, 0)

                .padding(.bottom, 4)
                .frame(width: 377, alignment: .center)
                .background(Constants.BackgroundSecondary)
                .cornerRadius(12)
                .overlay(
                RoundedRectangle(cornerRadius: 12)
                .inset(by: 0.5)
                .stroke(Constants.GreyGrey200, lineWidth: 1)
                )

                Spacer()
               
                NavigationLink(destination:SignUp_1()) {
                    Text("Devam Et")
                        .modifier(buttonBlueToggleStyle(isToggle: selectedOption && selectedOption2))
                        .padding(.bottom)
                }
                .disabled(!(selectedOption && selectedOption2))
               
                
                
                
                               }
        }
    }
}

#Preview {
    Contracts()
}
