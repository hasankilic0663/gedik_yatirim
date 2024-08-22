//
//  Button.swift
//  gedik_yatirim
//
//  Created by Hasan on 2.08.2024.
//

import Foundation


import SwiftUI

struct buttonBlue : ViewModifier {
    func body(content : Content) -> some View {
        content
            .font(
                Font.custom("Plus Jakarta Sans", size: 16)
                    .weight(.semibold)
            )
            .foregroundColor(Constants.ShadesWhite)
            .padding(.horizontal, 16)
            .padding(.vertical, 10)
            .frame(width: 361, height: 48, alignment: .center)
            .background(Constants.FillColorFillColor600)
            .cornerRadius(12)
    }
    
}
struct buttonBlueToggleStyle : ViewModifier {
    var isToggle : Bool = false
    func body(content : Content) -> some View {
        content
            .font(
                Font.custom("Plus Jakarta Sans", size: 16)
                    .weight(.semibold)
            )
            .foregroundColor(isToggle ? Constants.ShadesWhite : Constants.GreyGrey500)
            .padding(.horizontal, 16)
            .padding(.vertical, 10)
            .frame(width: 361, height: 48, alignment: .center)
            .background(isToggle ?  Constants.FillColorFillColor600 : Constants.GreyGrey100)
            .cornerRadius(12)
            
    }
    
}
struct buttonBlueSheet : ViewModifier {
    func body(content : Content) -> some View {
        content
            .font(
                Font.custom("Plus Jakarta Sans", size: 16)
                    .weight(.semibold)
            )
            .foregroundColor(Constants.ShadesWhite)
            .padding(.horizontal, 12)
            .padding(.vertical, 10)
            .frame(maxWidth: .infinity, minHeight: 40, maxHeight: 40, alignment: .center)
            .background(Constants.FillColorFillColor600)
            .cornerRadius(10)
    }
    
}
struct buttonStroke : ViewModifier {
    func body(content : Content) -> some View {
        content
            .font(
            Font.custom("Plus Jakarta Sans", size: 16)
            .weight(.semibold)
            )
            .foregroundColor(Constants.FillColorFillColor600)
            .padding(.horizontal, 16)
            .padding(.vertical, 10)
            .frame(width: 361, height: 48, alignment: .center)
            .background(Constants.ShadesWhite)
            .cornerRadius(12)
            .overlay(
            RoundedRectangle(cornerRadius: 12)
            .inset(by: 0.5)
            .stroke(Constants.FillColorFillColor600, lineWidth: 1)
            )
    }
    
}
struct buttonStrokeSheet : ViewModifier {
    func body(content : Content) -> some View {
        content
            .font(
                Font.custom("Plus Jakarta Sans", size: 16)
                    .weight(.semibold)
            )
            .foregroundColor(Constants.FillColorFillColor600)
            .padding(.horizontal, 12)
            .padding(.vertical, 10)
            .frame(maxWidth: .infinity, minHeight: 40, maxHeight: 40, alignment: .center)
            .background(Constants.ShadesWhite)
            .cornerRadius(10)
            .overlay(
            RoundedRectangle(cornerRadius: 12)
            .inset(by: 0.5)
            .stroke(Constants.FillColorFillColor600, lineWidth: 1)
            )
    }
    
}

struct buttonOrange : ViewModifier {
    func body(content : Content) -> some View {
        content
            .font(
                Font.custom("Plus Jakarta Sans", size: 16)
                    .weight(.semibold)
            )
            .foregroundColor(Constants.ShadesWhite)
            .padding(.horizontal, 16)
            .padding(.vertical, 10)
            .frame(width: 361, height: 48, alignment: .center)
            .background(Constants.OrangeOrange500)
            .cornerRadius(12)
    }
    
}
struct buttonHide : ViewModifier {
    func body(content : Content) -> some View {
        content
            .font(
                Font.custom("Plus Jakarta Sans", size: 16)
                    .weight(.semibold)
            )
            .foregroundColor(Constants.ShadesWhite)
            .padding(.horizontal, 16)
            .padding(.vertical, 10)
            .frame(width: 361, height: 48, alignment: .center)
            
            .cornerRadius(12)
    }
    
}

struct buttonWhite : ViewModifier {
    func body(content : Content) -> some View {
        content
            .font(
                Font.custom("Plus Jakarta Sans", size: 16)
                    .weight(.semibold)
            )
            .foregroundColor(Constants.FillColorFillColor600)
            .padding(.horizontal, 16)
            .padding(.vertical, 10)
            .frame(width: 361, height: 48, alignment: .center)
            .background(Constants.BackgroundPrimary)
            .cornerRadius(12)
    }
    
}



struct buttonsmall : ViewModifier {
    func body(content : Content) -> some View {
        content
            .overlay {
                RoundedRectangle(cornerRadius: 8)
                    .inset(by: 0.5)
                    .stroke(Color(red: 0.9, green: 0.92, blue: 0.95),lineWidth: 1)
            }
    }
    
}

