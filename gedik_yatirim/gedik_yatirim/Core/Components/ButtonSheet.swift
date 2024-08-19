//
//  ButtonSheet.swift
//  gedik_yatirim
//
//  Created by Hasan on 15.08.2024.
//

import SwiftUI

struct ButtonSheet: View {
    @Binding var isSheetPresendet : Bool
    var textAuto : String
    var title : String
    var body: some View {
        Button {
            isSheetPresendet = true
        } label: {
            HStack{
                VStack{
                    Text(title)
                        .modifier(textFieldTitle())
                        .padding(.top,2)
                        .padding(.bottom,2)
                    
                        Text(textAuto)
                            
                            .font(
                                Font.custom("Plus Jakarta Sans", size: 14)
                                    .weight(.medium)
                            )
                            .foregroundColor(Constants.LabelColorPrimary)
                        .keyboardType(.numberPad)
                        .frame(maxWidth: .infinity, alignment: .topLeading)
                    
                }
               Image("chevron-down-black")
                    
                    .padding(.top,8)
                    
            }
            .modifier(textFieldBox())
        }
    }
}

