//
//  ComplianceTest .swift
//  gedik_yatirim
//
//  Created by Hasan on 19.08.2024.
//

import SwiftUI

struct ComplianceTest: View {
    @State var currentStep : Int = 3
     @StateObject var viewModel = ComplianceTestViewModel()
    var body: some View {
        ZStack{
            VStack{
                CustomHeader( title: "Uygunluk Testi    ")
                ExtractedViewBar(currentStep: $currentStep, textaciklama: "Hesap açılışınız sonrasında yatırım işlemlerinizi yapabilmeniz için şimdi uygunluk testini yapmak ister misiniz?")
                Image("Compliance")
                    .padding(.top,33)
                
                Spacer()
                NavigationLink {
                    SuitabilityTest1()
                        .navigationBarBackButtonHidden()
                } label: {
                    Text("Başla")
                        .modifier(buttonBlue())
                }
                Button {
                    viewModel.showAlert = true
                } label: {
                    Text("Testi Sonra Yap")
                        .modifier(buttonWhite())
                }


                
            }
            if viewModel.showAlert {
                CustomAlertView3(viewModel: viewModel)
                
            }

        }
        .background(Constants.BackgroundPrimary)
    }
}

#Preview {
    ComplianceTest()
}

struct CustomAlertView3: View {
    @ObservedObject var viewModel = ComplianceTestViewModel()

    var body: some View {
        
            Color.black.opacity(0.3)
                .ignoresSafeArea()

        
            VStack(spacing: 3) {
                Image("infomodal")
                Text("Testi Ertelemek İstediğinize Emin misiniz?")
                .font(
                Font.custom("Plus Jakarta Sans", size: 18)
                .weight(.semibold)
                )
                .multilineTextAlignment(.center)
                .foregroundColor(Constants.FillColorFillColor600)
                .frame(maxWidth: .infinity, alignment: .top)

                Text("Yatırım işlemlerinize hesap açılış sonrası hemen başlayabilmeniz için uygunluk testini tamamlamanız gerekmektedir.")
                    .font(
                    Font.custom("Plus Jakarta Sans", size: 15)
                    .weight(.medium)
                    )
                    .multilineTextAlignment(.center)
                    .foregroundColor(Constants.LabelColorSecondary)
                    .frame(maxWidth: .infinity, alignment: .top)
                    .padding(.bottom)
                NavigationLink {
                    SuitabilityTest1()
                        .navigationBarBackButtonHidden()
                } label: {
                    Text("Başla")
                        .modifier(buttonBlueSheet())
                }
                NavigationLink {
                    Contracts()
                        .navigationBarBackButtonHidden()
                } label: {
                    Text("Ertele")
                        .modifier(buttonStrokeSheet())
                }


            }
            .padding()
            .background(Color.white)
            .cornerRadius(20)
            .shadow(radius: 10)
            .frame(maxWidth: 350)
            .padding()
        
    }
}
