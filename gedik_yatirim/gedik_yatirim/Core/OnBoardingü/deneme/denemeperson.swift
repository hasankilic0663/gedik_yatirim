import SwiftUI

struct denemeperson: View {
    @State var sehir = "İstanbul"
    @State var ilce = "Seçiniz"
    @State var adres = ""
    @State var meslekara = ""
    @State var ilceara = ""
    @State var currentStep: Int = 2
    @State var isSheetPresendet : Bool = false
    @State var isIlceSheetPresented : Bool = false
    private let totalSteps: Int = 5
    @State private var selectedOption: Int? = nil
    @State private var selectedOption2: Int? = nil
    @State var selected : Int = 0
    var errorActive: [Bool] = [false, false, false, false] //
    var sehirler = ["İstanbul", "Ankara", "İzmir", "Bursa", "Antalya", "Trabzon", "Konya", "Samsun", "Kayseri", "Kocaeli", "Gaziantep", "Şanlıurfa", "Muğla", "Manisa", "Elazığ"]

    var sehirIlceDizisi: [[String]] = [
        ["Adalar", "Arnavutköy", "Ataşehir", "Avcılar", "Bağcılar", "Bahçelievler", "Bakırköy", "Başakşehir", "Bayrampaşa", "Beşiktaş",
         "Beykoz", "Beylikdüzü", "Beyoğlu", "Büyükçekmece", "Çatalca", "Çekmeköy", "Esenler", "Esenyurt", "Eyüpsultan", "Fatih",
         "Gaziosmanpaşa", "Güngören", "Kadıköy", "Kağıthane", "Kartal", "Küçükçekmece", "Maltepe", "Pendik", "Sancaktepe", "Sarıyer",
         "Silivri", "Sultanbeyli", "Sultangazi", "Şile", "Şişli", "Tuzla", "Ümraniye", "Üsküdar", "Zeytinburnu"],
        ["Çankaya", "Keçiören", "Mamak"],
        ["İzmir", "Konak", "Karşıyaka", "Bornova"]
    ]

    var body: some View {
        ScrollViewReader { proxy in
            ScrollView {
                ZStack {
                    VStack {
                        CustomHeader(title: "Kişisel Bilgileriniz")
                        
                        ExtractedViewBar(currentStep: $currentStep, textaciklama: "Sizi daha yakından tanıyabilmemiz ve ihtiyaçlarınıza özel çözümler sunabilmemiz için lütfen kişisel bilgilerinizi bizimle paylaşın.")
                        
                        ButtonSheet(isSheetPresendet: $isSheetPresendet, textAuto: "\(sehir)", title:"İl")
                            .sheet(isPresented: $isSheetPresendet) {
                                ExtractedSheet(selectedOption: $selectedOption,
                                               meslekara: $meslekara,
                                               sehir: $sehir,
                                               title: "İl Seçimi",
                                               ilce: ilce,
                                               dizi: sehirler,
                                               selected: $selected,
                                               isSheetPresendet: $isSheetPresendet, searchBool: true)
                            }
                        
                        ButtonSheet(isSheetPresendet: $isIlceSheetPresented, textAuto: "\(ilce)", title: "İlçe")
                            .sheet(isPresented: $isIlceSheetPresented) {
                                ZStack {
                                    Color.white.ignoresSafeArea()
                                    VStack {
                                        Text("İl Seçimi")
                                            .padding(.top, 20)
                                            .padding(.bottom)
                                            .font(Font.custom("Plus Jakarta Sans", size: 16).weight(.semibold))
                                            .multilineTextAlignment(.center)
                                            .foregroundColor(Constants.LabelColorPrimary)
                                        
                                        HStack {
                                            Image("search")
                                            TextField("Şehir ara", text: $ilceara)
                                                .font(Font.custom("Plus Jakarta Sans", size: 12).weight(.medium))
                                                .foregroundColor(Constants.LabelColorSecondary)
                                            Spacer()
                                        }
                                        .padding(.horizontal, 8)
                                        .padding(.vertical, 10)
                                        .background(Constants.GreyGrey100)
                                        .cornerRadius(8)
                                        .overlay(RoundedRectangle(cornerRadius: 8).inset(by: 0.5).stroke(Constants.GreyGrey200, lineWidth: 1))
                                        
                                        VStack {
                                            List(0..<sehirIlceDizisi[selected].count, id: \.self) { item in
                                                ZStack {
                                                    HStack(alignment: .center, spacing: 5) {
                                                        Text(sehirIlceDizisi[selected][item])
                                                            .font(Font.custom("Plus Jakarta Sans", size: 13).weight(.semibold))
                                                            .multilineTextAlignment(.leading)
                                                            .foregroundColor(Constants.LabelColorPrimary)
                                                            .padding(.vertical, 4)
                                                        Spacer()
                                                        Image(self.selectedOption2 == item ? "RadioButtonFill" : "RadioButton")
                                                            .foregroundColor(self.selectedOption2 == item ? .blue : .gray)
                                                            .padding(.trailing, 3)
                                                            .onTapGesture {
                                                                self.selectedOption2 = item
                                                            }
                                                    }
                                                }
                                                .padding(.horizontal, 10)
                                                .padding(.vertical, 8)
                                                .background(self.selectedOption2 == item ? Color.blue.opacity(0.2) : Color.white)
                                                .cornerRadius(8)
                                                .overlay(
                                                    RoundedRectangle(cornerRadius: 8)
                                                        .inset(by: 0.5)
                                                        .stroke(self.selectedOption2 == item ? Color.blue : Color.clear, lineWidth: 1)
                                                )
                                            }
                                            .listStyle(PlainListStyle())
                                            .padding(.horizontal, -20)
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
                                            if let selectedOption2 = selectedOption2 {
                                                ilce = sehirIlceDizisi[selected][selectedOption2]
                                            }
                                            isIlceSheetPresented = false
                                        } label: {
                                            Text("Seçimi Uygula")
                                                .modifier(buttonBlue())
                                        }
                                        Button {} label: {
                                            Text("Vazgeç")
                                                .modifier(buttonStroke())
                                        }
                                    }
                                    .ignoresSafeArea(.keyboard)
                                }
                                .presentationDetents([.height(650)])
                                .presentationDragIndicator(.hidden)
                            }
                        
                        HStack {
                            VStack {
                                Text("Adres")
                                    .modifier(textFieldTitle())
                                    .padding(.top, 2)
                                TextField("Lorem ipsum dolor sit amet consectetur", text: $adres)
                                    .font(Font.custom("Plus Jakarta Sans", size: 14).weight(.medium))
                                    .foregroundColor(Constants.LabelColorPrimary)
                                    .keyboardType(.default)
                                    .onTapGesture {
                                        proxy.scrollTo("Adres", anchor: .center)
                                    }
                            }
                        }
                        .modifier(textFieldBox())
                        
                        HStack {
                            Image("information-circle")
                            Text("İkametgah adresiniz, teyit bilgisindeki adresle aynı olmalıdır.")
                                .font(Font.custom("Plus Jakarta Sans", size: 11).weight(.medium))
                                .foregroundColor(Constants.LabelColorSecondary)
                        }
                        .padding(.top, 10)
                        
                        Spacer()
                        
                        VStack(alignment: .center, spacing: 0) {
                            HStack(alignment: .center, spacing: 4) {
                                Text("Adres Teyit Belgesi")
                                    .font(Font.custom("Plus Jakarta Sans", size: 12).weight(.medium))
                                    .foregroundColor(Constants.LabelColorSecondary)
                                    .padding(.horizontal, 0)
                                Image("information-circle")
                            }
                            .frame(height: 24, alignment: .center)
                            
                            Button {} label: {
                                HStack(alignment: .center, spacing: 4) {
                                    Image("cloud-upload")
                                    Text("Belge Yükle")
                                        .font(Font.custom("Plus Jakarta Sans", size: 12).weight(.semibold))
                                        .foregroundColor(Constants.FillColorFillColor600)
                                }
                                .padding(.horizontal, 8)
                                .padding(.vertical, 10)
                                .frame(maxWidth: .infinity, minHeight: 32, maxHeight: 32, alignment: .center)
                                .cornerRadius(8)
                            }
                        }
                        .padding(.horizontal, 24)
                        .padding(.vertical, 4)
                        .background(Constants.FillColorFillColor100)
                        .cornerRadius(12)
                        .overlay(
                            RoundedRectangle(cornerRadius: 12)
                                .inset(by: 0.5)
                                .stroke(Constants.GreyGrey200, lineWidth: 1)
                        )
                        .frame(maxWidth: .infinity, alignment: .center)
                    }
                    .frame(maxWidth: .infinity)
                    .padding(.horizontal, 20)
                    .padding(.bottom, 0)
                    .ignoresSafeArea(.keyboard)
                }
            }
        }
    }
}
#Preview {
    denemeperson()
}
