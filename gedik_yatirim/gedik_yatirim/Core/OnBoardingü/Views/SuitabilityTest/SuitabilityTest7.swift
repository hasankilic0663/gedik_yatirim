//
//  SuitabilityTest7.swift
//  gedik_yatirim
//
//  Created by Hasan on 21.08.2024.
//

import SwiftUI

struct SuitabilityTest7: View {
    @State var currentStep : Int = 3
    var urun = ["Hazine Bonosu/Devlet Tahvili","Hisse Senedi","VİOP (Vadeli İşlem ve Opsiyonel Piyasası)","Varant","Kredili Alım, Açığa Satış ve Ödünç İşlemler"]
    @State var selectedOption: Bool = false
    @State var isSheetpermission : Bool = false
    var body: some View {
        ZStack{
            Constants.BackgroundPrimary
                .ignoresSafeArea()
            VStack{
                CustomHeader(title: "Uygunluk Testi", logoutDestination: AnyView(CompletedTestNot()))
                ScrollView{
                    ExtractedViewBar(currentStep: $currentStep, textaciklama: "Risk Grubunuza Uygun Olan Ürünler")
                    ExtractedList(selectedOption: .constant(nil), radiobutton: false, array: urun )
                    // Default/SemiBold/Body Large
                    Text("Risk Grubunuz Dışında Kalan Ürünler")
                        .font(
                            Font.custom("Plus Jakarta Sans", size: 15)
                                .weight(.semibold)
                        )
                        .fixedSize(horizontal: false, vertical: true) // Metni dikeyde sabitler, yatayda taşma yapmaz
                        .frame(width: 345, alignment: .top)
                        .multilineTextAlignment(.center)
                        .padding()
                    //                .padding(.vertical,3)
                    ExtractedList(selectedOption: .constant(nil), radiobutton: false, array: urun)
                    
                    Spacer()
                }
                
                VStack{
                    
                        HStack {
                            
                                Image( selectedOption ? "Checkboxfill" : "Checkbox") // SF Symbols kullanıldı
                                    .foregroundColor(selectedOption ? .blue : .gray)
                            Spacer()
                            
                            Text("Risk grubum dışındaki ürünlerde de işlem yapmak istiyorum.")
                                .font(
                                    Font.custom("Plus Jakarta Sans", size: 12)
                                        .weight(.medium)
                                )
                                .foregroundColor(selectedOption  ? Constants.FillColorFillColor600 : Constants.LabelColorSecondary)
                                .frame(maxWidth: .infinity, alignment: .topLeading)
                            
                            
                                    
                            
                            
                        }
                        .onTapGesture {
                            isSheetpermission = true
                        }
                        
                        .padding(.horizontal, 12)
                        .padding(.vertical, 8)
                        .frame(maxWidth: .infinity, minHeight: 48, maxHeight: 48, alignment: .leading)
                        .cornerRadius(4)
                        .frame(maxWidth: .infinity, minHeight: 38, maxHeight: 48, alignment: .center)
                        .background(selectedOption ? Constants.FillColorFillColor600.opacity(0.2) : Constants.BackgroundSecondary)
                        .cornerRadius(8)
                        
                        .overlay(
                            RoundedRectangle(cornerRadius: 8)
                            //                                                        .frame(width: UIScreen.main.bounds.width - 20) // Genişliği artırıyoruz
                                .inset(by: 0.5)
                            
                                .stroke(selectedOption ? Color.blue : Color.clear, lineWidth: 1)
                            
                            
                        )
                        .padding(.horizontal,8)
                    
                    NavigationLink {
                        Contracts()
                            .navigationBarBackButtonHidden()
                    } label: {
                        Text("Devam Et")
                            .modifier(buttonBlue())
                    }
                    
                }
                
               
               


            }
        }
        .sheet(isPresented : $isSheetpermission){
            
            ZStack {
                Color.white
                    .ignoresSafeArea()
                VStack{
                    Text("Risk Alarak İşlem Yapma")
                        .padding(.top, 20)
                        .padding(.bottom)
                        .font(
                            Font.custom("Plus Jakarta Sans", size: 16)
                                .weight(.semibold)
                        )
                        .multilineTextAlignment(.center)
                        .foregroundColor(Constants.LabelColorPrimary)
                
                    
                    // Default/Medium/Body Medium
                    VStack(alignment: .center, spacing: 10) { 
                        Text("Gerçekleştirmiş olduğum uygunluk testi sonucunda, risk ve getiri beklentilerime uygun olmayan sermaye piyasası araçları tarafıma bildirilmiş olup, yapılan uyarıya rağmen söz konusu yatırım araçlarında işlem yapmak (işlem yapmak üzere hesap açmak) istiyorum. Risk ve getiri tercihlerime uygun olmayan bu yatırım araçları ile ilgili olarak aracı kurumdan bire bir yatırım tavsiyesi alamayacağımı, gerçekleştireceğim işlemlere ilişkin tüm sorumluluğun şahsıma ait olduğunu kabul ve beyan ederim.")
                          .font(
                            Font.custom("Plus Jakarta Sans", size: 14)
                              .weight(.medium)
                          )
                          .foregroundColor(Constants.LabelColorPrimary)
                          .frame(maxWidth: .infinity, alignment: .topLeading)
                    }
                    .padding(.horizontal, 10)
                    .padding(.vertical, 8)
                    .frame(width: 377, alignment: .top)
                    
                    
                    Button {
                        isSheetpermission = false
                        selectedOption = true
                    } label: {
                        Text("Onaylıyorum")
                            .modifier(buttonBlue())
                    }
                    Button {
                        isSheetpermission = false
                        selectedOption = false
                    } label: {
                        Text("Vazgeç")
                            .modifier(buttonStroke())
                    }

                }
            }
            .presentationDetents([.height(380)]) // Sheet yüksekliğini orta boyutta tutar
            .presentationDragIndicator(.hidden)
        }
    }
}
#Preview {
    SuitabilityTest7()
}
