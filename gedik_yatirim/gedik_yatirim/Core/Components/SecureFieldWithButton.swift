//
//  SecureFieldWithButton.swift
//  gedik_yatirim
//
//  Created by Hasan on 4.08.2024.
//

import SwiftUI

struct SecureFieldWithButton: View {
    @FocusState var isfocused : Bool
    @Binding private var text: String
    @State private var isSecured: Bool = true
    private var title : String
    
    init(text: Binding<String>, _ title: String , isfocused : Bool
    ) {
        self._text = text
        
        self.title = title
        
    }
    
    var body: some View {
        ZStack(alignment: .trailing){
            VStack{
                HStack{
                    Image("usertc")
                        
                    VStack{
                        
                        Text("Şifre")
                            .modifier(textFieldTitle())
                            .padding(.top,7)
                        Group{
                            if isSecured{
                                SecureField(title,text: $text)
                                    .modifier(textFieldSecure())
                                    .keyboardType(.numberPad)
                                
                            }else{
                                TextField(title,text: $text)
                                    .modifier(textFieldSecure())
                                    .keyboardType(.numberPad)
                                    .onAppear{
                                        isfocused = true
                                    }
                            }
                                
                        }
                       
                    }
                    
                    
                }
            }
//            .modifier(textFieldBox())
            .padding(.horizontal, 12)
            .padding(.vertical, 8)
            .frame(maxWidth: .infinity, minHeight: 58, maxHeight: 58, alignment: .topLeading)
            .background(Constants.BackgroundTertiary)
            .cornerRadius(8)
            .overlay(
                RoundedRectangle(cornerRadius: 8)
                    .inset(by: 0.5)
                    .stroke(isfocused ? Color.blue :  Constants.GreyGrey300, lineWidth: 1)
            ).padding(.horizontal)
        
                .focused($isfocused)
            
            Button {
                isSecured.toggle()//toggle ederek true ise false false ise true
            } label: {
                Image(systemName: self.isSecured ? "eye.slash" : "eye") //true ise bu butonu false ıse dıger butonu goster
                    .tint(.gray)
            }
            .padding(.trailing,36)
            

        }
        

    }
}


#Preview {
    SecureFieldWithButton(text: .constant(""), "********",isfocused: false)
}
