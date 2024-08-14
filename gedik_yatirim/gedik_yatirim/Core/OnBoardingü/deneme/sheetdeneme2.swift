import SwiftUI

struct sheetdeneme2: View {
    @Environment(\.dismiss) var dismiss
    @State var sehir = "İstanbul"
    @State var ilce = "Seçiniz"
    @State var adres = ""
    @State var meslekara = ""
    @State var ilceara = ""
    @State private var currentStep: Int = 2
    @State var isSheetPresendet: Bool = false
    @State var isIlceSheetPresented: Bool = false
    private let totalSteps: Int = 5
    @State private var selectedOption: Int? = nil
    @State private var selectedIlce: String? = nil

    // Türkiye şehirlerini içeren bir dizi
    let sehirler = ["Adana", "Ankara", "İstanbul", "İzmir", "Bursa", "Antalya", "Trabzon", "Konya", "Samsun", "Kayseri","Kocaeli","Gaziantep", "Şanlıurfa", "Muğla","Manisa","Elazığ"]

    // İlçeler için bir sözlük
    let ilceler: [String: [String]] = [
        "İstanbul": ["Beşiktaş", "Kadıköy", "Üsküdar", "Fatih"],
        "Ankara": ["Çankaya", "Keçiören", "Mamak", "Yenimahalle"],
        "İzmir": ["Konak", "Karşıyaka", "Bornova", "Buca"],
        // Diğer şehirlerin ilçelerini buraya ekleyin
    ]

    var body: some View {
        ZStack {
            VStack {
                CustomHeader(title: "Kişisel Bilgileriniz")
                
                // Dolum barı
                HStack(alignment: .center, spacing: 2) {
                    ForEach(1...totalSteps, id: \.self) { step in
                        Rectangle()
                            .fill(step <= currentStep ? Color.blue : Color.gray.opacity(0.3))
                            .frame(width: 36, height: 5, alignment: .leading)
                            .cornerRadius(2.5)
                    }
                }
                .padding()

                Text("\(currentStep)/\(totalSteps)")
                    .font(Font.custom("Plus Jakarta Sans", size: 17).weight(.semibold))
                    .multilineTextAlignment(.center)
                    .foregroundColor(Constants.FillColorFillColor600)

                Text("Sizi daha yakından tanıyabilmemiz ve ihtiyaçlarınıza özel çözümler sunabilmemiz için lütfen kişisel bilgilerinizi bizimle paylaşın.")
                    .font(Font.custom("Plus Jakarta Sans", size: 15).weight(.semibold))
                    .multilineTextAlignment(.center)
                    .foregroundColor(Constants.LabelColorPrimary)
                    .frame(width: 345, alignment: .top)
                    .padding(.vertical, 9)

                // İl seçimi butonu
                Button {
                    isSheetPresendet = true
                } label: {
                    HStack {
                        VStack {
                            Text("İl")
                                .modifier(textFieldTitle())
                                .padding(.top, 2)
                            HStack {
                                Text(sehir)
                                    .font(Font.custom("Plus Jakarta Sans", size: 14).weight(.medium))
                                    .foregroundColor(Constants.LabelColorPrimary)
                                Spacer()
                            }
                        }
                        Image("chevron-down-black")
                            .padding(.top, 8)
                    }
                    .modifier(textFieldBox())
                }
                .sheet(isPresented: $isSheetPresendet) {
                    SehirSecimiSheet(sehirler: sehirler, selectedOption: $selectedOption) { selectedSehir in
                        sehir = selectedSehir
                        ilce = "Seçiniz" // İlçe seçiminde varsayılan değeri geri yükle
                    }
                }

                // İlçe seçimi butonu
                Button {
                    isIlceSheetPresented = true
                } label: {
                    HStack {
                        VStack {
                            Text("İlçe")
                                .modifier(textFieldTitle())
                                .padding(.top, 2)
                            HStack {
                                Text(ilce)
                                    .font(Font.custom("Plus Jakarta Sans", size: 14).weight(.medium))
                                    .foregroundColor(Constants.LabelColorPrimary)
                                Spacer()
                            }
                        }
                        Image("chevron-down-black")
                            .padding(.top, 8)
                    }
                    .modifier(textFieldBox())
                }
                .sheet(isPresented: $isIlceSheetPresented) {
                    IlceSecimiSheet(ilceler: ilceler[sehir] ?? [], selectedIlce: $selectedIlce) { selectedIlce in
                        ilce = selectedIlce
                    }
                }

                // Diğer form elemanları ve butonlar...

                Spacer()

                NavigationLink {
                    // Devam Et tıklama işlemi
                } label: {
                    Text("Devam Et")
                        .modifier(buttonBlue())
                        .padding(.top, 5)
                }
            }
            .padding(.bottom)
        }
        .background(Constants.BackgroundPrimary)
    }
}

struct SehirSecimiSheet: View {
    let sehirler: [String]
    @Binding var selectedOption: Int?
    let onSelect: (String) -> Void

    var body: some View {
        VStack {
            Text("İl Seçimi")
                .padding(.top, 20)
                .padding(.bottom)
                .font(Font.custom("Plus Jakarta Sans", size: 16).weight(.semibold))
                .multilineTextAlignment(.center)
                .foregroundColor(Constants.LabelColorPrimary)

            List(sehirler.indices, id: \.self) { index in
                HStack {
                    Text(sehirler[index])
                        .font(Font.custom("Plus Jakarta Sans", size: 13).weight(.semibold))
                        .multilineTextAlignment(.leading)
                        .foregroundColor(Constants.LabelColorPrimary)
                        .padding(.vertical, 4)
                    Spacer()
                    Image(selectedOption == index ? "RadioButtonFill" : "RadioButton")
                        .foregroundColor(selectedOption == index ? .blue : .gray)
                        .padding(.trailing, 3)
                        .onTapGesture {
                            selectedOption = index
                        }
                }
                .padding(.horizontal, 10)
                .padding(.vertical, 8)
                .background(selectedOption == index ? Color.blue.opacity(0.2) : Color.white)
                .cornerRadius(8)
                .onTapGesture {
                    selectedOption = index
                    onSelect(sehirler[index])
                }
            }

            Button {
                if let selectedOption = selectedOption {
                    onSelect(sehirler[selectedOption])
                }
            } label: {
                Text("Seçimi Uygula")
                    .modifier(buttonBlue())
            }
            Button {
                // Vazgeç tıklama işlemi
            } label: {
                Text("Vazgeç")
                    .modifier(buttonStroke())
            }
        }
    }
}

struct IlceSecimiSheet: View {
    let ilceler: [String]
    @Binding var selectedIlce: String?
    let onSelect: (String) -> Void

    var body: some View {
        VStack {
            Text("İlçe Seçimi")
                .padding(.top, 20)
                .padding(.bottom)
                .font(Font.custom("Plus Jakarta Sans", size: 16).weight(.semibold))
                .multilineTextAlignment(.center)
                .foregroundColor(Constants.LabelColorPrimary)

            List(ilceler, id: \.self) { ilce in
                HStack {
                    Text(ilce)
                        .font(Font.custom("Plus Jakarta Sans", size: 13).weight(.semibold))
                        .multilineTextAlignment(.leading)
                        .foregroundColor(Constants.LabelColorPrimary)
                        .padding(.vertical, 4)
                    Spacer()
                    Image(selectedIlce == ilce ? "RadioButtonFill" : "RadioButton")
                        .foregroundColor(selectedIlce == ilce ? .blue : .gray)
                        .padding(.trailing, 3)
                        .onTapGesture {
                            selectedIlce = ilce
                            onSelect(ilce)
                        }
                }
                .padding(.horizontal, 10)
                .padding(.vertical, 8)
                .background(selectedIlce == ilce ? Color.blue.opacity(0.2) : Color.white)
                .cornerRadius(8)
            }

            Button {
                if let selectedIlce = selectedIlce {
                    onSelect(selectedIlce)
                }
            } label: {
                Text("Seçimi Uygula")
                    .modifier(buttonBlue())
            }
            Button {
                // Vazgeç tıklama işlemi
            } label: {
                Text("Vazgeç")
                    .modifier(buttonStroke())
            }
        }
    }
}

#Preview {
    sheetdeneme2()
}
