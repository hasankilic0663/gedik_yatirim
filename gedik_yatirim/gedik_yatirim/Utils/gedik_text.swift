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

struct gedik_textBlackAciklama : ViewModifier {
    func body(content : Content) -> some View {
        content
            .font(
            Font.custom("Plus Jakarta Sans", size: 15)
            .weight(.semibold)
            )
            .multilineTextAlignment(.center)
            .foregroundColor(Constants.LabelColorPrimary)
            .frame(width: 345, alignment: .top)    }
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


struct gedik_text_Blue_semibold : ViewModifier {
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




struct errorMessageText : ViewModifier {
    func body(content : Content) -> some View {
        content
            .font(
                Font.custom("Plus Jakarta Sans", size: 12)
                    .weight(.medium)
            )
            .foregroundColor(Constants.RedRed600)
            .frame(maxWidth: .infinity, alignment: .topLeading)
            .padding(.horizontal,28)
    }
}


struct gedikInfotext : ViewModifier {
    func body(content : Content) -> some View {
        content
            .font(
            Font.custom("Plus Jakarta Sans", size: 12)
            .weight(.medium)
            )
            .foregroundColor(Constants.LabelColorSecondary)
            .frame(maxWidth: .infinity, alignment: .topLeading)
            .padding(.horizontal,28)
    }
}


    
