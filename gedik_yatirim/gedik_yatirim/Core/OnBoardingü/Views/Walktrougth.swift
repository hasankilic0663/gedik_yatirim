import SwiftUI

struct Walktrougth: View {
    @StateObject private var viewModel = OnboardingViewModel()
    
    var body: some View {
        NavigationStack {
            ZStack {
                LinearGradient(
                    gradient: Gradient(stops: [
                        Gradient.Stop(color: Color(red: 0.07, green: 0.16, blue: 0.39), location: 0.00),
                        Gradient.Stop(color: Color(red: 0, green: 0.33, blue: 1), location: 1.00),
                    ]),
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing
                )
                .ignoresSafeArea() // Tüm ekranı kaplar
                
                VStack {
                    Image("gedik")
                        .padding(.top, 66)
                        .padding(.bottom)
                    
                    TabView(selection: $viewModel.currentPage) {
                        ForEach(0..<viewModel.pages.count, id: \.self) { index in
                            VStack {
                                Text(viewModel.pages[index].text)
                                    .modifier(gedik_textwhitesb())
                                    
                                
                                Image(viewModel.pages[index].imageName)
    //
                                
                               Spacer()
                            }
                            .tag(index)
                            
                        }
                        
                    }
                    .tabViewStyle(PageTabViewStyle())
                    
                    
                    
                    // PageControl (sayfa denetimi)
                    PageControl(numberOfPages: viewModel.pages.count, currentPage: $viewModel.currentPage)
                        .padding(.top, 20)
                    Spacer(minLength: 100)
                  
                    NavigationLink {
                        Walktrougth_2()
                            .navigationBarBackButtonHidden()
                    } label: {
                        Text("Uygulamayı Güncelle")
                            .modifier(buttonWhite())
                    }

                    
                }
                .padding(.horizontal)
                .padding(.bottom)
                
                // Sayfa içeriği
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
    }
}

// PageControl: Sayfa denetimi
struct PageControl: View {
    var numberOfPages: Int
    @Binding var currentPage: Int

    var body: some View {
       Text("")
    }
}

#Preview {
    Walktrougth()
}
