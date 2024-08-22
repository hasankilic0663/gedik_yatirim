//
//  IncomeInformation.swift
//  gedik_yatirim
//
//  Created by Hasan on 15.08.2024.
//

import SwiftUI

struct IncomeInformation: View {
    @State var currentStep : Int = 2
  
    @State var isSheetPresendetmeslek : Bool = false
    @State var isSheetPresendetgelir : Bool = false
    @State var isSheetPresendetKaynak : Bool = false
    @State var isSheetPresendetBirikim : Bool = false
    @State private var selectedOptionjob: Int? = nil
    @State var meslekText = "Tasarımcı"
    @State var gelirText = "₺25.001 - ₺50.000"
    @State var kaynakText = "Maaş"
    @State var birikimtext = "₺0 - 150.0000"
    @State var selected : Int = 0
    
    @State var meslekara = ""
    
    var meslekler = ["Akademisyen/Öğr.Gör.","Analist/Programcı" ,"Astsubay","Aşçı/Garson/Barmen" ,"Avukat","Bankacı",  "Büyük Sanayici","Çalışmayan"]
    var gelir = ["₺0 - ₺15.000","₺15.001 - ₺25.000","₺25.001 - ₺50.000 ","₺50.001 üzeri"]
    
    var body: some View {
        ZStack{
            VStack{
                CustomHeader(title: "Kişisel Bilgileriniz")
                ExtractedViewBar(currentStep: $currentStep, textaciklama: "Toplam gelir bilgilerinizi eklemek, size uygun finansal çözümler sunmamıza yardımcı olacaktır.")
                    .padding(.bottom)
                ButtonSheet(isSheetPresendet: $isSheetPresendetmeslek, textAuto : meslekText, title:"Mesleğiniz")
                    .sheet(isPresented : $isSheetPresendetmeslek){
                        ExtractedSheet(  selectedOption: $selectedOptionjob,
                                        meslekara: $meslekara,
                                         sehir: $meslekText, title: "Meslek Seçimi", ilce: "",
                                       
                                        dizi: meslekler, // Normal bir değer olarak geçiyoruz
                                        selected: $selected,
                                         isSheetPresendet: $isSheetPresendetmeslek, searchBool: true) // Sheet’i sürükleme göstergesini gizler
                        
                    }
                ButtonSheet(isSheetPresendet: $isSheetPresendetgelir, textAuto: gelirText, title:"Aylık Geliriniz")
                    .sheet(isPresented : $isSheetPresendetgelir){
                        ExtractedSheetSmall(selectedOption: $selectedOptionjob,
                                            selection: $gelirText,
                                            title:  "Aylık Geliriniz",
                                            dizi: gelir,
                                            
                                            selected: $selected,//değişti
                                            isSheetPresendet: $isSheetPresendetgelir,
                                            searchBool: false)
                    }
                ButtonSheet(isSheetPresendet: $isSheetPresendetKaynak, textAuto: kaynakText , title:"Kazanç Kaynağınız")
                ButtonSheet(isSheetPresendet: $isSheetPresendetBirikim, textAuto: birikimtext, title:"Birikiminiz")
                Spacer()
                NavigationLink {
                    IncomeInf2()
                        .navigationBarBackButtonHidden()
                } label: {
                    Text("Devam Et")
                        .modifier(buttonBlue())
                        .padding(.bottom)
                }
                

            }
        }
        .background(Constants.BackgroundPrimary)
       
        .sheet(isPresented : $isSheetPresendetKaynak){
            Text("Kaynaklar")
                .presentationDetents([.height(440)]) // Sheet yüksekliğini orta boyutta tutar
                .presentationDragIndicator(.hidden)
        }
        
        .sheet(isPresented : $isSheetPresendetBirikim){
            Text("Birikim")
                .presentationDetents([.height(440)]) // Sheet yüksekliğini orta boyutta tutar
                .presentationDragIndicator(.hidden)
        }
    }
}

#Preview {
    IncomeInformation()
}
