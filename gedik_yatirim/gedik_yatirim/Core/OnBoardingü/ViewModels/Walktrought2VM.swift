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
        OnboardingPageData2(imageName: "ww1", text: "Hemen hesap açın, 6 ay boyunca geçerli ücretsiz veri yayını kazanın!"),
        OnboardingPageData2(imageName: "ww2", text: "Hesabınız yoksa görüntülü görüşmeyle hızlı hesap açabilirsiniz."),
        OnboardingPageData2(imageName: "ww3", text: "Portföyünüzü görüntüleyebilir, piyasaları kolayca takip edebilirsiniz."),
        OnboardingPageData2(imageName: "ww4", text: "Uygulamamızın sunduğu özellikleri keşfedebilir ve deneyimleyebilirsiniz."),
        OnboardingPageData2(imageName: "ww5", text: "Portföyünüze yeni bir yatırım ürünü ekleyebilir, bilgilerinizi güncelleyebilirsiniz.")
    ]
}

struct OnboardingPageData2 {
    let imageName: String
    let text: String
}
