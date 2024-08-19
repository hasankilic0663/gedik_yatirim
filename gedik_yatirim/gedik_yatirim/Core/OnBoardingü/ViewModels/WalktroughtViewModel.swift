//
//  WalktroughtViewModel.swift
//  gedik_yatirim
//
//  Created by Hasan on 6.08.2024.
//

import Foundation
import SwiftUI
import Combine

// ViewModel
class OnboardingViewModel: ObservableObject {
    @Published var currentPage: Int = 0
    
    let pages: [OnboardingPageData] = [
        OnboardingPageData(imageName: "walkthroug-image", text: "Gedix uygulamamız yeni bir sürüme güncellenmiştir. Uygulamaya devam etmek için versiyon yükseltmeniz gerekmektedir."),
        OnboardingPageData(imageName: "walktrought-2", text: "Size daha iyi bir hizmet verebilmek için uygulamamızı güncelledik devam etmek için lütfen güncelleyiniz."),
      
    ]
}

struct OnboardingPageData {
    let imageName: String
    let text: String
}
