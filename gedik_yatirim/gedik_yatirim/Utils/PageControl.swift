//
//  PageControl.swift
//  gedik_yatirim
//
//  Created by Hasan on 1.08.2024.
//

import SwiftUI

struct PageControl: View {
    var body: some View {
        
        Text("Gedix uygulamamız yeni bir sürüme güncellenmiştir. Uygulamaya devam etmek için versiyon yükseltmeniz gerekmektedir.")
            .modifier(gedik_text())
        Image("walkthroug-image")
            .frame(width: 300,height: 300)
    }
}

#Preview {
    PageControl()
}
