//
//  Walktrougth.swift
//  gedik_yatirim
//
//  Created by Hasan on 1.08.2024.
//

import SwiftUI

struct OnboardingPageData {
    let imageName: String
    let text: String
}

struct Walktrougth: View {
    // Onboarding sayfalarının verileri
    let pages: [OnboardingPageData] = [
        OnboardingPageData(imageName: "walkthroug-image", text: "Bu, birinci sayfa."),
        OnboardingPageData(imageName: "exampleImage2", text: "Bu, ikinci sayfa."),
        OnboardingPageData(imageName: "exampleImage3", text: "Bu, üçüncü sayfa."),
        OnboardingPageData(imageName: "exampleImage4", text: "Bu, dördüncü sayfa.")
    ]
    
    @State private var currentPage = 0
    
    var body: some View {
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

            Image("GedikLogo")
            .frame(width: 661, height: 701)
//            .background(.white.opacity(0.03))
            
            VStack{
                Image("gedik")
                    .padding(.top,66)
                    .padding(.bottom)
                
                ScrollView(.horizontal) {
                    HStack {
//                        ForEach(0..<pages.count) { item in
//                            s(data: pages[item]).frame(minWidth: 300, maxWidth: 300, maxHeight: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .center)
//                        }
                    }.background(GeometryReader { geometry -> Color in
                        currentPage = Int(-geometry.frame(in: .named("scroll")).origin.x)
                        print(currentPage)
                        return Color.clear
                    })
//                    pages.map({ OnboardingPage(data: $0)
//                    })
//                    OnboardingPage(data: pages.first!)
//                    PageViewController(pages: pages.map({ OnboardingPage(data: $0)
//                    }), currentPage: $currentPage)
                }.coordinateSpace(name: "scroll")
                

//                TabView(selection: $currentPage) {
//
//                }
//                .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
//                .animation(.easeInOut)
////                .animation(.easeInOut, value: $currentPage)
//                .frame(height: 400)
//                
                
                CustomPageControl(currentPage: currentPage, numberOfPages: pages.count)
                    .padding()
                Button(action: {
                    currentPage += 1
                }, label: {
                    Text("tikla")
                })
                    Spacer()
                
                
            }.padding(.horizontal)
            
           


        }
        .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/,maxHeight: .infinity)
        
        
//        .background(
//        LinearGradient(
//        stops: [
//        Gradient.Stop(color: Color(red: 0.07, green: 0.16, blue: 0.39), location: 0.00),
//        Gradient.Stop(color: Color(red: 0, green: 0.33, blue: 1), location: 1.00),
//        ],
//        startPoint: UnitPoint(x: 1, y: 0),
//        endPoint: UnitPoint(x: 0, y: 1)
//        )
//        .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/,maxHeight: .infinity)
//        .ignoresSafeArea()
//        
//        
//        )
        
        
    }
}
// Onboarding sayfasının görünümü
struct OnboardingPage: View {
    var data: OnboardingPageData
    
    var body: some View {
        VStack {
            Image(data.imageName)
                .resizable()
                .scaledToFit()
                .frame(width: 200, height: 200)
                .padding(.top, 40)
            
            Text(data.text)
                .font(.headline)
                .padding()
                .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
                .multilineTextAlignment(.center)
            
            Spacer()
        }
    }
}

// Özel sayfa kontrol noktaları
struct CustomPageControl: View {
    var currentPage: Int
    var numberOfPages: Int

    var body: some View {
        HStack(spacing: 8) {
            ForEach(0..<numberOfPages, id: \.self) { index in
                RoundedRectangle(cornerRadius: 4)
                    .fill(index == currentPage ? Color.blue : Color.gray)
                    .frame(width: 20, height: 8)
            }
        }
    }
}

#Preview {
    Walktrougth()
}

struct PageViewController<Page: View>: UIViewControllerRepresentable {
    var pages: [Page]
    @Binding var currentPage: Int
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }

    func makeUIViewController(context: Context) -> UIPageViewController {
        let pageViewController = UIPageViewController(
            transitionStyle: .scroll,
            navigationOrientation: .horizontal)
        pageViewController.delegate = context.coordinator
        return pageViewController
    }

    func updateUIViewController(_ pageViewController: UIPageViewController, context: Context) {
        pageViewController.setViewControllers(
            [context.coordinator.controllers[currentPage]], direction: .forward, animated: true)
    }
    
    class Coordinator: NSObject, UIPageViewControllerDelegate {
        var parent: PageViewController
        var controllers = [UIViewController]()
        
        init(_ pageViewController: PageViewController) {
            parent = pageViewController
            controllers = parent.pages.map { UIHostingController(rootView: $0) }
        }
        
        func pageViewController(
            _ pageViewController: UIPageViewController,
            didFinishAnimating finished: Bool,
            previousViewControllers: [UIViewController],
            transitionCompleted completed: Bool) {
            if completed,
               let visibleViewController = pageViewController.viewControllers?.first,
               let index = controllers.firstIndex(of: visibleViewController) {
                parent.currentPage = index
            }
        }
    }
}
