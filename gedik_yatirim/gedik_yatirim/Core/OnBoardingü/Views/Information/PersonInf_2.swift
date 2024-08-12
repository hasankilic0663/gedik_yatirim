//
//  PersonInf_2.swift
//  gedik_yatirim
//
//  Created by Hasan on 12.08.2024.
//

import SwiftUI

struct PersonInf_2: View {
    @Environment(\.dismiss) var  dismiss
    @State var sehir = ""
    @State var ilce = ""
    @State private var currentStep: Int = 1
    private let totalSteps: Int = 5
    var body: some View {
        ZStack{
            
            VStack{
                HStack(alignment:.center){
                    Button {
                        
                    } label: {
                        Image(systemName: "chevron.left") // Back simgesi
                            .frame(width: 20, height: 20)
                            .foregroundColor(.black)
                            .padding(6)
                            .onTapGesture {
                                dismiss()//butona tıklandıgında dısmıss gelıcek ve kapatılcak burası dismiss olacak yok edılcek
                            }
                    }
                    .modifier(buttonsmall())
                    Spacer()
                    Text("Kişisel Bilgileriniz")
                        .font(
                        Font.custom("Plus Jakarta Sans", size: 17)
                        .weight(.semibold)
                        )
                        .multilineTextAlignment(.center)
                        .foregroundColor(Constants.FillColorFillColor600)
                        .padding(.trailing,35)
                    Button {
                        
                    } label: {
                        Image("Gedixx") // Back simgesi
                            .frame(width: 20, height: 20)
                            .foregroundColor(.black)
                            .padding(6)
                    }
                    .modifier(buttonsmall())
                    Button {
                        
                    } label: {
                        Image("LogOut") // Back simgesi
                            .frame(width: 20, height: 20)
                            
                            
                            .padding(6)
                    }
                    .modifier(buttonsmall())

                    
                }
                .padding(.top)
                .padding(.horizontal)
                
                // dolum barı
                HStack(alignment: .center,spacing: 2) {
                                ForEach(1...totalSteps, id: \.self) { step in
                                    Rectangle()
                                        .fill(step <= currentStep ? Color.blue : Color.gray.opacity(0.3))
                                        .frame(width: 36, height: 5, alignment: .leading)
                                        .cornerRadius(2.5)
//                                        .padding(.horizontal,0)
                                }
                            }
                .padding()
                
                Text("\(currentStep)/\(totalSteps)")
                    .font(
                    Font.custom("Plus Jakarta Sans", size: 17)
                    .weight(.semibold)
                    )
                    .multilineTextAlignment(.center)
                    .foregroundColor(Constants.FillColorFillColor600)
                
                Text("Sizi daha yakından tanıyabilmemiz ve ihtiyaçlarınıza özel çözümler sunabilmemiz için lütfen kişisel bilgilerinizi bizimle paylaşın.")
                .font(
                Font.custom("Plus Jakarta Sans", size: 15)
                .weight(.semibold)
                )
                .multilineTextAlignment(.center)
                .foregroundColor(Constants.LabelColorPrimary)
                .frame(width: 345, alignment: .top)
                .padding(.top,5)
                
                HStack{
                    VStack{
                        Text("İl")
                            .modifier(textFieldTitle())
                            .padding(.top,2)
                        HStack {
                            Text("İstanbul")
                                
                                .font(
                                    Font.custom("Plus Jakarta Sans", size: 14)
                                        .weight(.medium)
                                )
                                .foregroundColor(Constants.LabelColorPrimary)
                            .keyboardType(.numberPad)
                            Spacer()
                        }
                    }
                   Image("chevron-down-black")
                        
                        .padding(.top,8)
                        
                }
                .modifier(textFieldBox())
                Button {
                    
                } label: {
                    HStack{
                        VStack{
                            Text("İl")
                                .modifier(textFieldTitle())
                                .padding(.top,2)
                            HStack {
                                Text("Kağıthane")
                                    
                                    .font(
                                        Font.custom("Plus Jakarta Sans", size: 14)
                                            .weight(.medium)
                                    )
                                    .foregroundColor(Constants.LabelColorPrimary)
                                .keyboardType(.numberPad)
                                Spacer()
                            } // Sayısal klavye sağlar
                        }
                        Image("chevron-down-black")
                             
                             .padding(.top,8)
                    }
                    .modifier(textFieldBox())
                    
                }

                
                HStack{
                    VStack{
                        Text("İl")
                            .modifier(textFieldTitle())
                            .padding(.top,2)
                        TextField("İstanbul",text: $sehir)
                            
                            .font(
                                Font.custom("Plus Jakarta Sans", size: 14)
                                    .weight(.medium)
                            )
                            .foregroundColor(Constants.LabelColorPrimary)
                            .keyboardType(.numberPad) // Sayısal klavye sağlar
                    }
                    
                }
                .modifier(textFieldBox())
                Spacer()
            }
        }
        .background(Constants.BackgroundPrimary)
        
        
    }
}

#Preview {
    PersonInf_2()
}
