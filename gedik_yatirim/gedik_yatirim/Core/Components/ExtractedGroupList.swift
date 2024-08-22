//
//  ExtractedGroupList.swift
//  gedik_yatirim
//
//  Created by Hasan on 20.08.2024.
//

import SwiftUI

struct ExtractedGroupList : View {
    @State var selectedOptions: [Int?] = Array(repeating: nil, count: 5) // 5 satır için seçim
    var riskGroups : [String]
    var options : [String]
   
    var body: some View {
        
        VStack{
            // Başlıklar
            
            HStack {
                Text("Risk Grupları")
                    .font(
                        Font.custom("Plus Jakarta Sans", size: 13)
                            .weight(.medium)
                    )
                    .foregroundColor(Constants.LabelColorSecondary)
                    .frame(width: 116, alignment: .topLeading)
                
                Spacer()
                HStack(alignment: .center){
                    ForEach(options, id: \.self) { header in
                        Text(header)
                            .font(
                                Font.custom("Plus Jakarta Sans", size: 10)
                                    .weight(.medium)
                            )
                            .multilineTextAlignment(.center)
                            .foregroundColor(Constants.LabelColorSecondary)
                            .frame(maxWidth: .infinity, alignment: .top)
                           
                        Spacer()
                        if header  != options.last{
                            Divider()
                                .frame(height: 28)
                        }
                        
                        Spacer()
                    }
                    
                }
                
                
                .frame(width: 200, alignment: .center)
                
            }
            
            .padding(.top,4)
            .padding(.bottom, 2)
            
            .padding(.horizontal,7)
            
            // Risk Grupları ve Seçenekler
            ForEach(0..<riskGroups.count, id: \.self) { index in
                Divider()
                HStack() {
                    Text(riskGroups[index])
                        .font(
                            Font.custom("Plus Jakarta Sans", size: 13)
                                .weight(.medium)
                        )
                        .foregroundColor(Constants.LabelColorSecondary)
                        .frame(width: 116, alignment: .topLeading)
                        .padding(.leading,6)
                    Spacer()
                    HStack(alignment: .center ,spacing:45){
                        ForEach(0..<3, id: \.self) { optionIndex in
                            Image( selectedOptions[index] == optionIndex ? "RadioButtonFill" : "RadioButton")
                                .foregroundColor(selectedOptions[index] == optionIndex ? .blue : .gray)
                                .onTapGesture {
                                    selectedOptions[index] = optionIndex
                                }
                            
                            
                            
                        }
                        
                    }
                    .padding(.trailing,40)
                }
                .padding(.vertical, 10)
            }
        }
        .padding(4)
        .frame(width: 377, alignment: .center)
        .background(.white)
        .cornerRadius(12)
        .overlay(
            RoundedRectangle(cornerRadius: 12)
                .inset(by: 0.5)
                .stroke(Constants.GreyGrey200, lineWidth: 1)
        )
        
        .fixedSize(horizontal: false, vertical: true) // Metni dikeyde sabitler, yatayda taşma yapmaz
        
    }
}

#Preview {
    ExtractedGroupList(riskGroups: riskGroups, options: optionss)
}
var optionss = ["Bilgim Yok", "Bilgim\nKısıtlı",  "Bilgim\nYeterli"]
var riskGroups = ["Bilgim Yok", "Bilgim Kısıtlı",  "Bilgim Yeterli"]
