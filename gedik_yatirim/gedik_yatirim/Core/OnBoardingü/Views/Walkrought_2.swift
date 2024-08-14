import SwiftUI

struct Walktrougth_2: View {
    @StateObject private var viewModel = OnboardingViewModel2()
    @State private var notificationCount: Int = 3
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
                ZStack{
                    Image("GedikLogo")
                               .padding(.bottom,60)
                }
                VStack {
                    HStack{
                        Spacer()
                        Button {
                            
                        } label: {
                            Image("Gedixx")
                                .padding(2)
                                .frame(width: 32, height: 32, alignment: .center)
                                .background(Constants.BackgroundSecondary)
                                .cornerRadius(38)
                                .padding(.horizontal)
                        }

                        Button {
                            
                        } label: {
                            ZStack{
                                Image("notification")
                                
                                if notificationCount > 0 {
                                    ZStack {
                                        Rectangle()
                                            .fill(Constants.RedRed500)
                                            
                                            .frame(width: 20,height: 15)
                                            .cornerRadius(5)
                                        
                                        Text("\(notificationCount)")
                                            .font(.caption)
                                            .foregroundColor(.white)
                                    }
                                    .offset(x: 10, y: -10) // Rozetin konumu
                                }
                            }
                        }

                        
                        
                    }
                    .padding(.horizontal)
                    Image("gedik")
                        .padding(.top, 22)
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
                    PageControl2(numberOfPages: viewModel.pages.count, currentPage: $viewModel.currentPage)
                        .padding(.top, 20)
                    Spacer()
                    NavigationLink {
                        SignUp_1()
                            .navigationBarBackButtonHidden()
                        
                    } label: {
                        Text("Hesap Aç")
                            .modifier(buttonOrange())
                    }
                    NavigationLink{
                        LogIn()
                            .navigationBarBackButtonHidden()
                    } label: {
                        Text("Hesabım var")
                            .modifier(buttonWhite())
                    }
                    Button {
                        
                    } label: {
                        Text("Uygulamayı Keşfet")
                            .modifier(buttonHide())
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
struct PageControl2: View {
    var numberOfPages: Int
    @Binding var currentPage: Int

    var body: some View {
       Text("")
    }
}

#Preview {
    Walktrougth_2()
}
