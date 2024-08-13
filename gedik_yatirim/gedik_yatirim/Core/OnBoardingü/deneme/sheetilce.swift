//
//  sheetilce.swift
//  gedik_yatirim
//
//  Created by Hasan on 13.08.2024.
//

import SwiftUI

struct sheetilce: View {
    @Environment(\.dismiss) var  dismiss
    @State var sehir = "İstanbul"
    @State var ilce = ""
    @State var adres = ""
    @State var meslekara = ""
    @State private var currentStep: Int = 2
    @State var isSheetPresendet : Bool = false
    @State var isIlceSheetPresented: Bool = false
    private let totalSteps: Int = 5
    @State private var selectedOption: Int? = nil
    @State private var selectedIlce: Int? = nil
     
    // Türkiye şehirlerini içeren bir dizi
      let sehirler = ["Adana", "Ankara", "İstanbul", "İzmir", "Bursa", "Antalya", "Trabzon", "Konya", "Samsun", "Kayseri","Kocaeli","Gaziantep", "Şanlıurfa", "Muğla","Manisa","Elazığ"       ]
     
    // İlçeler için bir sözlük
      let ilceler: [String: [String]] = [
          "İstanbul": ["Beşiktaş", "Kadıköy", "Üsküdar", "Fatih"],
          "Ankara": ["Çankaya", "Keçiören", "Mamak", "Yenimahalle"],
          "İzmir": ["Konak", "Karşıyaka", "Bornova", "Buca"],
          // Diğer şehirlerin ilçelerini buraya ekleyin
      ]
    
    var body: some View {
        Button {
            isSheetPresendet = true
        } label: {
            HStack{
                VStack{
                    Text("İlçe")
                        .modifier(textFieldTitle())
                        .padding(.top,2)
                    HStack {
                        Text(ilceler["Ankara"][0])
                            
                            .font(
                                Font.custom("Plus Jakarta Sans", size: 14)
                                    .weight(.medium)
                            )
                            .foregroundColor(Constants.LabelColorPrimary)
                        .keyboardType(.numberPad)
                        Spacer()
                    }
                }
               Image("chevron-down-black")
                    
                    .padding(.top,8)
                    
            }
            .modifier(textFieldBox())
        }
        .sheet(isPresented : $isSheetPresendet){
            ZStack {
                Color.white
                    .ignoresSafeArea()
                VStack{
                    Text("İl Seçimi")
                        .padding(.top, 20)
                        .padding(.bottom)
                    .font(
                    Font.custom("Plus Jakarta Sans", size: 16)
                    .weight(.semibold)
                    )
                    .multilineTextAlignment(.center)
                    .foregroundColor(Constants.LabelColorPrimary)
                    HStack() {
                        Image("search")
                        TextField("Şehir ara",text: $meslekara)
                            .font(
                            Font.custom("Plus Jakarta Sans", size: 12)
                            .weight(.medium)
                            )
                            
                            .foregroundColor(Constants.LabelColorSecondary)
                        Spacer()
                        
                    }
                    .padding(.horizontal, 8)
                    .padding(.vertical, 10)
                    .frame(width: 377, height: 36, alignment: .leading)
                    .background(Constants.GreyGrey100)
                    .cornerRadius(8)
                    .overlay(
                    RoundedRectangle(cornerRadius: 8)
                    .inset(by: 0.5)
                    .stroke(Constants.GreyGrey200, lineWidth: 1)
                    )
                    VStack{
                       
                        List(0..<sehirler.count, id: \.self) { item in
                            ZStack{
                                HStack(alignment: .center, spacing: 5) {
                                    Text(sehirler[item])
                                        .font(
                                            Font.custom("Plus Jakarta Sans", size: 13)
                                                .weight(.semibold)
                                        )
                                        .multilineTextAlignment(.leading)
                                        .foregroundColor(Constants.LabelColorPrimary)
                                        .padding(.vertical,4)
                                    Spacer()
                                    
                                    Image(self.selectedOption == item ? "RadioButtonFill" : "RadioButton")
                                        .foregroundColor(self.selectedOption == item ? .blue : .gray)
                                        .padding(.trailing,3)
                                        .onTapGesture {
                                            self.selectedOption = item
                                        }
                                }
                                
                                
                            }
                            .padding(.horizontal, 10)
                            
                            .padding(.vertical,8)
                            .frame(maxWidth: .infinity, minHeight: 48, maxHeight: 68, alignment: .center)
                                        .background(self.selectedOption == item ? Color.blue.opacity(0.2) : Color.white)
                                        .cornerRadius(8)
                                       
                                        .overlay(
                                            RoundedRectangle(cornerRadius: 8)
//                                                        .frame(width: UIScreen.main.bounds.width - 20) // Genişliği artırıyoruz
                                                .inset(by: 0.5)
                                                
                                                .stroke(self.selectedOption == item ? Color.blue : Color.clear, lineWidth: 1)
                                              
                                            
                                        )
                                    }
                                    .listStyle(PlainListStyle()) // List stilini düz yapar, arka planı beyaz yapar
//                                            .padding(.leading, -20) // Listenin soldaki boşluğunu azaltıyoruz
//                                            .padding(.trailing, -20)
                                    .padding(.horizontal,-20)
                    }
                    .padding(4)
                    .frame(width: 377, height: 444, alignment: .top)
                    .background(Constants.BackgroundSecondary)
                    .cornerRadius(12)
                    .overlay(
                    RoundedRectangle(cornerRadius: 12)
                    .inset(by: 0.5)
                    .stroke(Constants.GreyGrey200, lineWidth: 1)
                    )

                    
                                
                    Button {
                        if let selectedOption = selectedOption {
                                                           sehir = sehirler[selectedOption]
                                                       }
                        isSheetPresendet = false
                        
                    } label: {
                        
                        Text("Seçimi Uygula")
                        .modifier(buttonBlue())
                    }
                    Button{} label : {
                        Text("Vazgeç")
                            .modifier(buttonStroke())
                            
                    }

                    
                }
             
            }
//                    .frame(height: 300) // Sheet’in yüksekliğini sabitler
                .presentationDetents([.height(650)]) // Sheet yüksekliğini orta boyutta tutar
                .presentationDragIndicator(.hidden) // Sheet’i sürükleme göstergesini gizler
            
        }
    }
}

#Preview {
    sheetilce()
}
