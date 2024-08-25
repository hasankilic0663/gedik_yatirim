import SwiftUI

struct SuitabilityTest2: View {
    @State var currentStep: Int = 3
    var vade = ["Kısa Vadeli  (0-6 Ay)", "Orta Vadeli  (6-12 Ay)", "Uzun Vadeli (1-3 Yıl)", "Uzun Vadeli (3 Yıldan uzun)"]
    @State var selectedOption: String? = nil // String? olarak tanımlandı
    @State var selectedBool: Bool = false
    var body: some View {
        ZStack {
            VStack {
                CustomHeader(title: "Uygunluk Testi   ", logoutDestination: AnyView(CompletedTestNot()))
                    
                ExtractedViewBar(currentStep: $currentStep, textaciklama: "Yatırımlarınızı Ne Kadar Süreyle Değerlendirmeyi Planlıyorsunuz?")
                ExtractedList(selectedOption: $selectedOption, radiobutton: true , array: vade)
                    .onChange(of: selectedOption) { newValue in
                        // Seçim yapıldığında butonun rengini ve etkinliğini güncelle
                        if newValue != nil {
                            selectedBool = true
                        } else {
                            selectedBool = false
                        }
                    }

                
                Spacer()
                NavigationLink {
                    SuitabilityTest3()
                        .navigationBarBackButtonHidden()
                } label: {
                    Text("Devam Et")
                        .modifier(buttonBlueToggleStyle(isToggle: selectedBool))
                        .padding(.bottom)
                }
                .disabled(!selectedBool)

            }
        } .background(Constants.BackgroundPrimary)
    }
}

#Preview {
    SuitabilityTest2()
}

