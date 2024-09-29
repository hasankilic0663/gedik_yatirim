//
//  NFCNotFound.swift
//  gedik_yatirim
//
//  Created by Hasan on 25.08.2024.
//

import SwiftUI

struct NFCNotFound: View {
    var body: some View {
        ZStack{
            Constants.BackgroundPrimary
                .ignoresSafeArea()
            VStack{
                CustomHeadernotchevron()
                Spacer()
                
            }
        }
   
    }
}

#Preview {
    NFCNotFound()
}
