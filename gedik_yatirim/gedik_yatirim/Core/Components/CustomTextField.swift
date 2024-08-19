//
//  CustomTextField.swift
//  gedik_yatirim
//
//  Created by Hasan on 19.08.2024.
//

import SwiftUI

struct CustomTextField: View {
    @State var inputText : String = ""
    @State var title : String
    @State var text : String
    var body: some View {
        VStack{
            Text(title)
                .modifier(textFieldTitle())
            TextField("\(text)" , text: $inputText)
                .modifier(textFieldText())
                .font(
                Font.custom("Plus Jakarta Sans", size: 14)
                .weight(.medium)
                )
                .foregroundColor(Constants.LabelColorPrimary)
                .keyboardType(.numberPad) // Sayısal klavye sağlar
        }
        .modifier(textFieldBox())
        
    }
}

#Preview {
    CustomTextField(title: "Başlık", text: "OtoYazı")
}
