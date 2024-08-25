
import SwiftUI

struct SuitabilityTest1: View {
    @State var currentStep: Int = 3
    var egitim = ["İlköğretim / Ortaöğretim", "Lise", "Lisans ve üstü"]
    @State var selectedOption: String? = nil
    @State var selectedBool: Bool = false

    var body: some View {
        ZStack {
            VStack {
                CustomHeader(title: "Uygunluk Testi     ", logoutDestination: AnyView(CompletedTestNot()))
                // Dolum barı
                ExtractedViewBar(currentStep: $currentStep, textaciklama: "Eğitim Bilginiz?")
                    .padding(.bottom)
                ExtractedList(selectedOption: $selectedOption, radiobutton: true, array: egitim)
                    .onChange(of: selectedOption) { newValue in
                        // Seçim yapıldığında butonun rengini ve etkinliğini güncelle
                        if newValue != nil {
                            selectedBool = true
                        } else {
                            selectedBool = false
                        }
                    }

                Spacer()
                
//                NavigationLink(destination: SuitabilityTest2()) {
//                    Text("Devam Et")
//                        .modifier(buttonBlueToggleStyle(isToggle: selectedBool))
//                        .padding(.bottom)
//                }
//                .disabled(!selectedBool) // Butonun etkinliğini kontrol et
                NavigationLink {
                    SuitabilityTest2()
                        .navigationBarBackButtonHidden()
                } label: {
                    Text("Devam Et")
                        .modifier(buttonBlueToggleStyle(isToggle: selectedBool))
                        .padding(.bottom)
                }
                .disabled(!selectedBool)

            }
        }
        .background(Constants.BackgroundPrimary)
    }
}

#Preview {
    SuitabilityTest1()
}





////
////  SuitabilityTest1.swift
////  gedik_yatirim
////
////  Created by Hasan on 19.08.2024.
////
//
//import SwiftUI
//
//struct SuitabilityTest1: View {
//    @State var currentStep : Int = 3
//    var egitim  = ["İlköğretim / Ortaöğretim","Lise","Lisans ve üstü"]
//    @State var selectedOption: String? = nil
//    @State var selectedBool : Bool = false
//
//    var body: some View {
//        
//        ZStack{
//            VStack{
//                CustomHeader( title: "Uygunluk Testi     "  )
//                // dolum barı
//                ExtractedViewBar(currentStep: $currentStep, textaciklama: "Eğitim Bilginiz?")
//                    .padding(.bottom)
//                ExtractedList(selectedOption: $selectedOption, radiobutton: true, array: egitim)
//
//                Spacer()
//                NavigationLink(destination: SuitabilityTest2()) {
//                    Button{
//                        
//                        if selectedOption != nil {
//                            selectedBool = true
//                        }
//                            
//                    } label: {
//                        Text("Devam Et")
//                            .modifier(buttonBlueToggleStyle(isToggle: selectedBool))
//                            .padding(.bottom)
//                           
//                    }.disabled(selectedBool)
//                }
////                .padding(4)
////              .frame(width: 377, height: 200 , alignment: .top)
//////                .frame(height : CGFloat(dizi.count * 68))
////                .background(Constants.BackgroundSecondary)
////                .cornerRadius(12)
////                .overlay(
////                    RoundedRectangle(cornerRadius: 12)
////                        .inset(by: 0.5)
////                        .stroke(Constants.GreyGrey200, lineWidth: 1)
////                )
////                .padding(.horizontal,3)
////                Spacer()
//               
//            }
//        }
//        .background(Constants.BackgroundPrimary)
//    }
//}
//
//#Preview {
//    SuitabilityTest1()
//}
