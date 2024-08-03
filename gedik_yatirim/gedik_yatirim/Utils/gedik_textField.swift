//
//  gedik_textField.swift
//  gedik_yatirim
//
//  Created by Hasan on 2.08.2024.
//

import Foundation
import SwiftUI

struct textFieldTitle : ViewModifier {
    func body(content : Content) -> some View {
        content
            .font(Font.custom("Plus Jakarta Sans", size: 12))
            .foregroundColor(Constants.LabelColorTertiary)
            .frame(maxWidth: .infinity, alignment: .topLeading)
    }
}


struct textFieldText : ViewModifier {
    func body(content : Content) -> some View {
        content
            .font(
            Font.custom("Plus Jakarta Sans", size: 12)
            .weight(.medium)
            )
            .foregroundColor(Constants.GreyGrey700)
            .frame(maxWidth: .infinity, alignment: .topLeading)
    }
}


struct textFieldSmallBox : ViewModifier {
    func body(content : Content) -> some View {
        content
            .padding(12)
            .frame(width: 40, height: 56, alignment: .center)
            .background(Constants.BackgroundTertiary)
            .cornerRadius(4)
            .overlay(
            RoundedRectangle(cornerRadius: 4)
            .inset(by: 0.5)
            .stroke(Constants.GreyGrey300, lineWidth: 1)
            )
    }
}
