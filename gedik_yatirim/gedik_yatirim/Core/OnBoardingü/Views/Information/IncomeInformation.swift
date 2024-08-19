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
                Button {
                    
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
        }
        .sheet(isPresented : $isSheetPresendetBirikim){
            Text("Birikim")
        }
        
//            ZStack {
//                Color.white
//                    .ignoresSafeArea()
//                VStack{
//                    Text("İl Seçimi")
//                        .padding(.top, 20)
//                        .padding(.bottom)
//                        .font(
//                            Font.custom("Plus Jakarta Sans", size: 16)
//                                .weight(.semibold)
//                        )
//                        .multilineTextAlignment(.center)
//                        .foregroundColor(Constants.LabelColorPrimary)
//                    HStack() {
//                        Image("search")
//                        TextField("Şehir ara",text: $ilceara)
//                            .font(
//                                Font.custom("Plus Jakarta Sans", size: 12)
//                                    .weight(.medium)
//                            )
//                        
//                            .foregroundColor(Constants.LabelColorSecondary)
//                        Spacer()
//                        
//                    }
//                    .padding(.horizontal, 8)
//                    .padding(.vertical, 10)
//                    .frame(width: 377, height: 36, alignment: .leading)
//                    .background(Constants.GreyGrey100)
//                    .cornerRadius(8)
//                    .overlay(
//                        RoundedRectangle(cornerRadius: 8)
//                            .inset(by: 0.5)
//                            .stroke(Constants.GreyGrey200, lineWidth: 1)
//                    )
//                    VStack{
//                        
//                        List(0..<sehirIlceDizisi[selected].count, id: \.self) { item in
//                            ZStack{
//                                HStack(alignment: .center, spacing: 5) {
//                                    Text(sehirIlceDizisi[selected][item])
//                                        .font(
//                                            Font.custom("Plus Jakarta Sans", size: 13)
//                                                .weight(.semibold)
//                                        )
//                                        .multilineTextAlignment(.leading)
//                                        .foregroundColor(Constants.LabelColorPrimary)
//                                        .padding(.vertical,4)
//                                    Spacer()
//                                    
//                                    Image(self.selectedOption2 == item ? "RadioButtonFill" : "RadioButton")
//                                        .foregroundColor(self.selectedOption2 == item ? .blue : .gray)
//                                        .padding(.trailing,3)
//                                        .onTapGesture {
//                                            self.selectedOption2 = item
//                                        }
//                                }
//                                
//                                
//                            }
//                            .padding(.horizontal, 10)
//                            
//                            .padding(.vertical,8)
//                            .frame(maxWidth: .infinity, minHeight: 48, maxHeight: 68, alignment: .center)
//                            .background(self.selectedOption2 == item ? Color.blue.opacity(0.2) : Color.white)
//                            .cornerRadius(8)
//                            
//                            .overlay(
//                                RoundedRectangle(cornerRadius: 8)
//                                //                                                        .frame(width: UIScreen.main.bounds.width - 20) // Genişliği artırıyoruz
//                                    .inset(by: 0.5)
//                                
//                                    .stroke(self.selectedOption2 == item ? Color.blue : Color.clear, lineWidth: 1)
//                                
//                                
//                            )
//                        }
//                        .listStyle(PlainListStyle()) // List
//                        .padding(.horizontal,-20)
//                    }
//                    .padding(4)
//                    .frame(width: 377, height: 444, alignment: .top)
//                    .background(Constants.BackgroundSecondary)
//                    .cornerRadius(12)
//                    .overlay(
//                        RoundedRectangle(cornerRadius: 12)
//                            .inset(by: 0.5)
//                            .stroke(Constants.GreyGrey200, lineWidth: 1)
//                    )
//                    
//                    
//                    
//                    Button {
//                        if let selectedOption2 = selectedOption2 {
//                            ilce = sehirIlceDizisi[selected][selectedOption2]
//                        }
//                        isIlceSheetPresented = false
//                        
//                    } label: {
//                        
//                        Text("Seçimi Uygula")
//                            .modifier(buttonBlue())
//                    }
//                    Button{} label : {
//                        Text("Vazgeç")
//                            .modifier(buttonStroke())
//                        
//                    }
//                    
//                    
//                }
//             
//            }
//
//                .presentationDetents([.height(650)]) // Sheet yüksekliğini orta boyutta tutar
//                .presentationDragIndicator(.hidden) // Sheet’i sürükleme göstergesini gizler

            
        
    }
}

#Preview {
    IncomeInformation()
}
