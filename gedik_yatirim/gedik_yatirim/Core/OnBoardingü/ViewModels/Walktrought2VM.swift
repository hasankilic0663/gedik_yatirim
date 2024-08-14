//
//  Walktrought2VM.swift
//  gedik_yatirim
//
//  Created by Hasan on 14.08.2024.
//

import Foundation
class OnboardingViewModel2: ObservableObject {
    @Published var currentPage: Int = 0
    
    let pages: [OnboardingPageData2] = [
        OnboardingPageData2(imageName: "walkthroug-image", text: "Gedix uygulamamız yeni bir sürüme güncellenmiştir. Uygulamaya devam etmek için versiyon yükseltmeniz gerekmektedir."),
        OnboardingPageData2(imageName: "walktrought-2", text: "Size daha iyi bir hizmet verebilmek için uygulamamızı güncelledik devam etmek için lütfen güncelleyiniz."),
        OnboardingPageData2(imageName: "third-image", text: "Üçüncü sayfa içeriği."),
        OnboardingPageData2(imageName: "fourth-image", text: "Dördüncü sayfa bilgisi."),
        OnboardingPageData2(imageName: "fifth-image", text: "Beşinci ve son sayfa bilgisi.")
    ]
}

struct OnboardingPageData2 {
    let imageName: String
    let text: String
}
