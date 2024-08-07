//
//  gedik_text.swift
//  gedik_yatirim
//
//  Created by Hasan on 1.08.2024.
//

import Foundation
import SwiftUI


struct gedik_textwhitesb : ViewModifier {
    func body(content : Content) -> some View {
        content
            .font(
            Font.custom("Plus Jakarta Sans", size: 17)
            .weight(.semibold)
            )
            .multilineTextAlignment(.center)
            .foregroundColor(Constants.ShadesWhite)
            .frame(width: 345, alignment: .top)
    }
}
    
struct gedik_textwhitem : ViewModifier {
    func body(content : Content) -> some View {
        content
            .font(
            Font.custom("Plus Jakarta Sans", size: 18)
            .weight(.medium)
            )
            .multilineTextAlignment(.center)
            .foregroundColor(Constants.ShadesWhite)
            .frame(width: 345, alignment: .top)
    }
}




struct gedik_text_black : ViewModifier {
    func body(content : Content) -> some View {
        content
            .font(
            Font.custom("Plus Jakarta Sans", size: 18)
            .weight(.semibold)
            )
            .multilineTextAlignment(.center)
            .foregroundColor(Constants.FillColorFillColor700)
            .frame(width: 345, alignment: .top)
    }
}


struct gedik_text_semibold : ViewModifier {
    func body(content : Content) -> some View {
        content
            .font(
            Font.custom("Plus Jakarta Sans", size: 24)
            .weight(.semibold)
            )
            .kerning(0.32)
            .multilineTextAlignment(.center)
            .foregroundColor(Constants.FillColorFillColor600)    }
}






struct Constants {
    static let ShadesWhite: Color = .white
    static let FillColorFillColor700: Color = Color(red: 0.07, green: 0.16, blue: 0.39)
    static let LabelColorTertiary: Color = Color(red: 0.53, green: 0.56, blue: 0.64)
    static let BackgroundTertiary: Color = Color(red: 0.99, green: 0.99, blue: 1)
    static let GreyGrey300: Color = Color(red: 0.85, green: 0.88, blue: 0.92)
    static let GreyGrey200: Color = Color(red: 0.9, green: 0.92, blue: 0.95)
    static let GreyGrey700: Color = Color(red: 0.58, green: 0.61, blue: 0.67)
    static let LabelColorSecondary: Color = Color(red: 0.36, green: 0.4, blue: 0.46)
    static let FillColorFillColor600: Color = Color(red: 0.05, green: 0.27, blue: 0.79)
    static let LabelColorPrimary: Color = Color(red: 0.06, green: 0.09, blue: 0.16)
    static let BackgroundPrimary: Color = Color(red: 0.96, green: 0.98, blue: 0.99)
    static let RedRed500: Color = Color(red: 0.75, green: 0, blue: 0)
    static let OrangeOrange500: Color = Color(red: 1, green: 0.59, blue: 0.21)
    static let BackgroundSecondary: Color = Color(red: 0.98, green: 0.98, blue: 0.99)
}

