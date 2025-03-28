//
//  PersonInf_2.swift
//  gedik_yatirim
//
//  Created by Hasan on 12.08.2024.
//

import SwiftUI

//struct SheetModel : Identifiable{
//    let id : String = UUID().uuidString
//    
//    
//    let name : String = ""
//}

struct PersonInf_2: View {
    
    @StateObject var viewModel = PersonInf_2ViewModel()

//    @State var sehir = "İstanbul"
//    @State var ilce = "Seçiniz"
//    @State var adres = ""
//    @State var meslekara = ""
//    @State var ilceara = ""
//    @State var currentStep: Int = 2
//    @State var isSheetPresendet : Bool = false
//    @State var isIlceSheetPresented : Bool = false
//    private let totalSteps: Int = 5
//    @State private var selectedOption: Int? = nil
//    @State private var selectedOption2: Int? = nil
//    @State var selected : Int = 0
////    @State private var selectedIlce: Int? = nil
////
//    // Türkiye şehirlerini içeren bir dizi
//      var sehirler = ["İstanbul", "Ankara","İzmir", "Bursa", "Antalya", "Trabzon", "Konya", "Samsun", "Kayseri","Kocaeli","Gaziantep", "Şanlıurfa", "Muğla","Manisa","Elazığ"   ]
//    
//    var sehirIlceDizisi: [[String]] = [
//        [
//            "Adalar", "Arnavutköy", "Ataşehir", "Avcılar", "Bağcılar", "Bahçelievler", "Bakırköy", "Başakşehir", "Bayrampaşa", "Beşiktaş",
//            "Beykoz", "Beylikdüzü", "Beyoğlu", "Büyükçekmece", "Çatalca", "Çekmeköy", "Esenler", "Esenyurt", "Eyüpsultan", "Fatih",
//            "Gaziosmanpaşa", "Güngören", "Kadıköy", "Kağıthane", "Kartal", "Küçükçekmece", "Maltepe", "Pendik", "Sancaktepe", "Sarıyer",
//            "Silivri", "Sultanbeyli", "Sultangazi", "Şile", "Şişli", "Tuzla", "Ümraniye", "Üsküdar", "Zeytinburnu"
//        ],
//            ["Çankaya", "Keçiören", "Mamak"],
//            ["İzmir", "Konak", "Karşıyaka", "Bornova"]
//        ]
//
//    // İlçeler için bir sözlük
//      let ilceler: [String: [String]] = [
//          "İstanbul": ["Beşiktaş", "Kadıköy", "Üsküdar", "Fatih"],
//          "Ankara": ["Çankaya", "Keçiören", "Mamak", "Yenimahalle"],
//          "İzmir": ["Konak", "Karşıyaka", "Bornova", "Buca"],
//          // Diğer şehirlerin ilçelerini buraya ekleyin
//      ]
//
    var body: some View {
        ZStack{
            VStack{
                CustomHeader(title: "Kişisel Bilgileriniz")
                
                // dolum barı
                ExtractedViewBar(currentStep: $viewModel.currentStep, textaciklama: "Sizi daha yakından tanıyabilmemiz ve ihtiyaçlarınıza özel çözümler sunabilmemiz için lütfen kişisel bilgilerinizi bizimle paylaşın.")
                
                // button sheet ile buton tasarım vb hepsını bı modellde topladık
                ButtonSheet(isSheetPresendet: $viewModel.isSheetPresendet, textAuto: "\(viewModel.sehir)", title:"İl")
                    .sheet(isPresented : $viewModel.isSheetPresendet){
                        ExtractedSheet(  selectedOption: $viewModel.selectedOption,
                                         meslekara: $viewModel.meslekara,
                                         sehir: $viewModel.sehir,
                                     title: "İl Seçimi",
                                         ilce: viewModel.ilce,
                                         dizi: viewModel.sehirler, // Normal bir değer olarak geçiyoruz
                                         selected: $viewModel.selected,
                                         isSheetPresendet: $viewModel.isSheetPresendet, searchBool: true) // Sheet’i sürükleme göstergesini gizler
                    
                }
                if viewModel.errorActive[0]{
                    // Default/Medium/Label Large
                    Text(viewModel.errorMessage[0])
                        .modifier(errorMessageText())
                }
                //--------------------------------------------------------------------------------
                ButtonSheet(isSheetPresendet: $viewModel.isIlceSheetPresented, textAuto: "\(viewModel.ilce)", title: "İlçe")
                    .sheet(isPresented : $viewModel.isIlceSheetPresented) {
                    
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
                                TextField("Şehir ara",text: $viewModel.ilceara)
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
                                
                                List(0..<viewModel.sehirIlceDizisi[viewModel.selected].count, id: \.self) { item in
                                    ZStack{
                                        HStack(alignment: .center, spacing: 5) {
                                            Text(viewModel.sehirIlceDizisi[viewModel.selected][item])
                                                .font(
                                                    Font.custom("Plus Jakarta Sans", size: 13)
                                                        .weight(.semibold)
                                                )
                                                .multilineTextAlignment(.leading)
                                                .foregroundColor(Constants.LabelColorPrimary)
                                                .padding(.vertical,4)
                                            Spacer()
                                            
                                            Image(self.viewModel.selectedOption2 == item ? "RadioButtonFill" : "RadioButton")
                                                .foregroundColor(self.viewModel.selectedOption2 == item ? .blue : .gray)
                                                .padding(.trailing,3)
                                                .onTapGesture {
                                                    self.viewModel.selectedOption2 = item
                                                }
                                        }
                                        
                                        
                                    }
                                    .padding(.horizontal, 10)
                                    
                                    .padding(.vertical,8)
                                    .frame(maxWidth: .infinity, minHeight: 48, maxHeight: 68, alignment: .center)
                                    .background(self.viewModel.selectedOption2 == item ? Color.blue.opacity(0.2) : Color.white)
                                    .cornerRadius(8)
                                    
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 8)
                                        //                                                        .frame(width: UIScreen.main.bounds.width - 20) // Genişliği artırıyoruz
                                            .inset(by: 0.5)
                                        
                                            .stroke(self.viewModel.selectedOption2 == item ? Color.blue : Color.clear, lineWidth: 1)
                                        
                                        
                                    )
                                }
                                .listStyle(PlainListStyle()) // List
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
                                if let selectedOption2 = viewModel.selectedOption2 {
                                    viewModel.ilce = viewModel.sehirIlceDizisi[viewModel.selected][selectedOption2]
                                }
                                viewModel.isIlceSheetPresented = false
                                
                            } label: {
                                
                                Text("Seçimi Uygula")
                                    .modifier(buttonBlue())
                            }
                            Button{} label : {
                                Text("Vazgeç")
                                    .modifier(buttonStroke())
                                
                            }
                            
                            
                        }
                        .ignoresSafeArea(.keyboard)
                    }

                        .presentationDetents([.height(650)]) // Sheet yüksekliğini orta boyutta tutar
                        .presentationDragIndicator(.hidden) // Sheet’i sürükleme göstergesini gizler
                }
                if viewModel.errorActive[1]{
                    // Default/Medium/Label Large
                    Text(viewModel.errorMessage[1])
                        .modifier(errorMessageText())
                }
                           
                HStack{
                    VStack{
                        Text("Adres")
                            .modifier(textFieldTitle())
                            .padding(.top,2)
                        TextField("Lorem ipsum dolor sit amet consectetur",text: $viewModel.adres)
                            
                            .font(
                                Font.custom("Plus Jakarta Sans", size: 14)
                                    .weight(.medium)
                            )
                            .foregroundColor(Constants.LabelColorPrimary)
                            .keyboardType(.numberPad) // Sayısal klavye sağlar
                    }
                    
                }
                .modifier(textFieldBoxPerson(error: viewModel.errorActive[2] ))
                if viewModel.errorActive[2]{
                    // Default/Medium/Label Large
                    Text(viewModel.errorMessage[2])
                        .modifier(errorMessageText())
                }
                
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
                
                NavigationLink(destination : IncomeInformation(), isActive:.constant(!viewModel.errorActive.contains(true))) {
                    Button{
                        viewModel.validation()
                    } label: {
                        Text("Devam Et")
                            .modifier(buttonBlue())
                            .padding(.top,5)
                    }
                }
                
            }
            .padding(.bottom)
        }
        .background(Constants.BackgroundPrimary)
        
        .navigationBarBackButtonHidden()
    }
}

#Preview {
    PersonInf_2()
}

