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
    @State private var currentStep: Int = 2
    @State var isSheetPresendet : Bool = false
    private let totalSteps: Int = 5
    var body: some View {
        ZStack{
           
            VStack{
                CustomHeader(title: "Kişisel Bilgileriniz")
              
                
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
                .padding(.vertical,9)
                
                
                Button {
                    isSheetPresendet = true
                } label: {
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
                }
                .sheet(isPresented : $isSheetPresendet){
                    List{
                        Text("Hasan")
                        Text("Hasan")
                        Text("Hasan")
                        Text("Hasan")
                    }
                }

               
                Button {
                    
                } label: {
                    HStack{
                        VStack{
                            Text("İlçe")
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
                        Text("Adres")
                            .modifier(textFieldTitle())
                            .padding(.top,2)
                        TextField("Lorem ipsum dolor sit amet consectetur",text: $sehir)
                            
                            .font(
                                Font.custom("Plus Jakarta Sans", size: 14)
                                    .weight(.medium)
                            )
                            .foregroundColor(Constants.LabelColorPrimary)
                            .keyboardType(.numberPad) // Sayısal klavye sağlar
                    }
                    
                }
                .modifier(textFieldBox())
                
                HStack{
                    Image("information-circle")
                    Text("İkametgah adresiniz, teyit bilgisindeki adresle aynı olmalıdır.")
                        .font(Font.custom("Plus Jakarta Sans", size: 11)
                            .weight(.medium))
                        .foregroundColor(Constants.LabelColorSecondary)
                }
                .padding(.top,10)
                Spacer()
                VStack(alignment : .center,spacing: 0){
                    HStack(alignment: .center, spacing: 4){
                        Text("Adres Teyit Belgesi")
                            .font(Font.custom("Plus Jakarta Sans", size: 12)
                                .weight(.medium))
                            .foregroundColor(Constants.LabelColorSecondary)
                            .padding(.horizontal,0)
                        Image("information-circle")
                    }
                    .padding(0)
                    .frame(height: 24, alignment: .center)

                    Button {
                        
                    } label: {
                        HStack(alignment: .center,spacing: 4){
                            Image("cloud-upload")
                            Text("Belge Yükle")
                                .font(
                                Font.custom("Plus Jakarta Sans", size: 12)
                                .weight(.semibold)
                                )
                                .foregroundColor(Constants.FillColorFillColor600)
                                
                        }
                        .padding(.horizontal, 8)
                        .padding(.vertical, 10)
                        .frame(width: .infinity, height: 32, alignment: .center)
                        .cornerRadius(8)
                    }

                    
                    
                }
                .padding(.horizontal, 24)
                .padding(.vertical, 4)
                .frame(width: 361, alignment: .top)
                .background(Constants.FillColorFillColor100)
                .cornerRadius(12)
                .overlay(
                RoundedRectangle(cornerRadius: 12)
                .inset(by: 0.5)
                .stroke(Constants.GreyGrey200, lineWidth: 1)
                )
                
                NavigationLink {
                    
                } label: {
                    Text("Devam Et")
                        .modifier(buttonBlue())
                        .padding(.top,5)
                }

            }
            .padding(.bottom)
        }
        .background(Constants.BackgroundPrimary)
        
        
    }
}

#Preview {
    PersonInf_2()
}
