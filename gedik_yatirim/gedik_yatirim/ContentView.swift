//
//  ContentView.swift
//  gedik_yatirim
//
//  Created by Hasan on 1.08.2024.
//

import SwiftUI

struct ContentView: View {
    @State private var isActive = false
    var body: some View {
        if isActive{
            Walktrougth()
        } else{
            Splash()
                .onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                    withAnimation {
                        self.isActive = true
        }
        
                }
            }
        }
        
        
    }
        
}

#Preview {
    ContentView()
}
