//
//  ExtractedList.swift
//  gedik_yatirim
//
//  Created by Hasan on 19.08.2024.
//

import Foundation
import SwiftUI

struct ExtractedList: View {
    @Binding var selectedOption: String?  // String? olarak tanımlandı

     var radiobutton : Bool
    var array  : [String]
    var body: some View {
        VStack(alignment: .center, spacing: 4) {
            ForEach(array, id: \.self) { item in
                
                //                        Rectangle()
                //                        .foregroundColor(.clear)
                //                        .frame(width: 369, height: 1)
                //
                //                        .background(Constants.GreyGrey100)
                HStack {
                    Text(item)
                        .font(
                            Font.custom("Plus Jakarta Sans", size: 13)
                                .weight(.medium)
                        )
                        .foregroundColor(selectedOption == item ? Constants.FillColorFillColor600 : Constants.LabelColorSecondary)
                        .frame(maxWidth: .infinity, alignment: .topLeading)
                    Spacer()
                    if radiobutton{
                        Image( selectedOption == item ? "RadioButtonFill" : "RadioButton") // SF Symbols kullanıldı
                            .foregroundColor(selectedOption == item ? .blue : .gray)
                            .onTapGesture {
                                selectedOption = item
                            }
                    }
                    
                }
                .padding(.horizontal, 12)
                .padding(.vertical, 8)
                .frame(maxWidth: .infinity, minHeight: 48, maxHeight: 48, alignment: .leading)
                .cornerRadius(4)
                .frame(maxWidth: .infinity, minHeight: 38, maxHeight: 48, alignment: .center)
                .background(selectedOption == item ? Constants.FillColorFillColor600.opacity(0.2) : Constants.BackgroundSecondary)
                .cornerRadius(8)
                
                .overlay(
                    RoundedRectangle(cornerRadius: 8)
                    //                                                        .frame(width: UIScreen.main.bounds.width - 20) // Genişliği artırıyoruz
                        .inset(by: 0.5)
                    
                        .stroke(selectedOption == item ? Color.blue : Color.clear, lineWidth: 1)
                    
                    
                )
                if item != array.last { // Çizgiyi son itemin altında göstermemek için
                    Rectangle()
                        .foregroundColor(.clear)
                        .frame(height: 1)
                        .background(Constants.GreyGrey100)
                }
                
            }
        }
        .padding(4)
        .frame(width: 377, alignment: .center)
        .background(Constants.BackgroundSecondary)
        .cornerRadius(12)
        .overlay(
            RoundedRectangle(cornerRadius: 12)
                .inset(by: 0.5)
                .stroke(Constants.GreyGrey200, lineWidth: 1)
        )
    }
}
