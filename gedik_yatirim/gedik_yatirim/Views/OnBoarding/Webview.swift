//
//  Webview.swift
//  gedik_yatirim
//
//  Created by Hasan on 2.08.2024.
//

import SwiftUI

struct Webview: View {
    @Environment(\.dismiss) var dismiss // buradakı gerı butonunu aktıf etme .    Dİsmis fonksıyonunu eklemeden calsımaz
    var body: some View {
        NavigationStack {
            VStack{
//                HStack{
//                    Button {
//
//                    } label: {
//                        Image(systemName: "chevron.left") // Back simgesi
//                            .frame(width: 20, height: 20)
//                            .foregroundColor(.black)
//                            .padding(6)
//                    }
//                    .modifier(buttonsmall())
//                    Spacer()
//                }
//                .padding()
                ScrollView{
                    Image("imageWebview1")
                    Image("imageWebview2")
                    Image("image48")
                }
                Button {
                    
                } label: {
                    Text("Onaylıyorum")
                        .modifier(buttonBlue())
                }

                .toolbar{
                    ToolbarItem( placement: .topBarLeading) {
                        Image(systemName: "chevron.left")
                            .frame(width: 20, height: 20)
                            .foregroundColor(.black)
                            .padding(6)
                            .modifier(buttonsmall())
                            .onTapGesture {
                                dismiss()//butona tıklandıgında dısmıss gelıcek ve kapatılcak burası dismiss olacak yok edılcek
                            }
                    }
                }
                
            }
            .padding(.bottom)
        }
    }
}

#Preview {
    Webview()
}
