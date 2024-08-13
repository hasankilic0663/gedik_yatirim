//
//  PersonInf_2.swift
//  gedik_yatirim
//
//  Created by Hasan on 12.08.2024.
//

import SwiftUI

struct sheet: View {
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
        ZStack{
           
            VStack{
                CustomHeader(title: "Kişisel Bilgileriniz")
              
                
                // dolum barı
                HStack(alignment: .center,spacing: 2) {
                                ForEach(1...totalSteps, id: \.self) { step in
                                    Rectangle()
                                        .fill(step <= currentStep ? Color.blue : Color.gray.opacity(0.3))
                                        .frame(width: 36, height: 5, alignment: .leading)
                                        .cornerRadius(2.5)
//                                        .padding(.horizontal,0)
                                }
                            }
                .padding()
                
                Text("\(currentStep)/\(totalSteps)")
                    .font(
                    Font.custom("Plus Jakarta Sans", size: 17)
                    .weight(.semibold)
                    )
                    .multilineTextAlignment(.center)
                    .foregroundColor(Constants.FillColorFillColor600)
                
                Text("Sizi daha yakından tanıyabilmemiz ve ihtiyaçlarınıza özel çözümler sunabilmemiz için lütfen kişisel bilgilerinizi bizimle paylaşın.")
                .font(
                Font.custom("Plus Jakarta Sans", size: 15)
                .weight(.semibold)
                )
                .multilineTextAlignment(.center)
                .foregroundColor(Constants.LabelColorPrimary)
                .frame(width: 345, alignment: .top)
                .padding(.vertical,9)
                
                
                Button {
                    isSheetPresendet = true
                } label: {
                    HStack{
                        VStack{
                            Text("İl")
                                .modifier(textFieldTitle())
                                .padding(.top,2)
                            HStack {
                                Text(sehir)
                                    
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
                //--------------------------------------------------------------------------------
                Button {
                    isSheetPresendet = true
                } label: {
                    HStack{
                        VStack{
                            Text("İlçe")
                                .modifier(textFieldTitle())
                                .padding(.top,2)
                            HStack {
                                Text(ilceler["Ankara"]?[0])
                                    
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
                

               
                Button {
                    
                } label: {
                    HStack{
                        VStack{
                            Text("İlçe")
                                .modifier(textFieldTitle())
                                .padding(.top,2)
                            HStack {
                                Text("Kağıthane")
                                    
                                    .font(
                                        Font.custom("Plus Jakarta Sans", size: 14)
                                            .weight(.medium)
                                    )
                                    .foregroundColor(Constants.LabelColorPrimary)
                                .keyboardType(.numberPad)
                                Spacer()
                            } // Sayısal klavye sağlar
                        }
                        Image("chevron-down-black")
                             
                             .padding(.top,8)
                    }
                    .modifier(textFieldBox())
                    
                }

                
                HStack{
                    VStack{
                        Text("Adres")
                            .modifier(textFieldTitle())
                            .padding(.top,2)
                        TextField("Lorem ipsum dolor sit amet consectetur",text: $adres)
                            
                            .font(
                                Font.custom("Plus Jakarta Sans", size: 14)
                                    .weight(.medium)
                            )
                            .foregroundColor(Constants.LabelColorPrimary)
                            .keyboardType(.numberPad) // Sayısal klavye sağlar
                    }
                    
                }
                .modifier(textFieldBox())
                
                HStack{
                    Image("information-circle")
                    Text("İkametgah adresiniz, teyit bilgisindeki adresle aynı olmalıdır.")
                        .font(Font.custom("Plus Jakarta Sans", size: 11)
                            .weight(.medium))
                        .foregroundColor(Constants.LabelColorSecondary)
                }
                .padding(.top,10)
                Spacer()
                VStack(alignment : .center,spacing: 0){
                    HStack(alignment: .center, spacing: 4){
                        Text("Adres Teyit Belgesi")
                            .font(Font.custom("Plus Jakarta Sans", size: 12)
                                .weight(.medium))
                            .foregroundColor(Constants.LabelColorSecondary)
                            .padding(.horizontal,0)
                        Image("information-circle")
                    }
                    .padding(0)
                    .frame(height: 24, alignment: .center)

                    Button {
                        
                    } label: {
                        HStack(alignment: .center,spacing: 4){
                            Image("cloud-upload")
                            Text("Belge Yükle")
                                .font(
                                Font.custom("Plus Jakarta Sans", size: 12)
                                .weight(.semibold)
                                )
                                .foregroundColor(Constants.FillColorFillColor600)
                                
                        }
                        .padding(.horizontal, 8)
                        .padding(.vertical, 10)
                        .frame(width: .infinity, height: 32, alignment: .center)
                        .cornerRadius(8)
                    }

                    
                    
                }
                .padding(.horizontal, 24)
                .padding(.vertical, 4)
                .frame(width: 361, alignment: .top)
                .background(Constants.FillColorFillColor100)
                .cornerRadius(12)
                .overlay(
                RoundedRectangle(cornerRadius: 12)
                .inset(by: 0.5)
                .stroke(Constants.GreyGrey200, lineWidth: 1)
                )
                
                NavigationLink {
                    
                } label: {
                    Text("Devam Et")
                        .modifier(buttonBlue())
                        .padding(.top,5)
                }

            }
            .padding(.bottom)
        }
        .background(Constants.BackgroundPrimary)
        
        
    }
}

#Preview {
    sheet()
}
