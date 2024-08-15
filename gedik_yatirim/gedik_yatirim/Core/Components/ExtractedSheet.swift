import SwiftUI


struct ExtractedSheet: View {
    @Binding var selectedOption: Int? // Seçili şehir
        @Binding var meslekara: String // Şehir arama TextField'ı
        @Binding var sehir: String // Seçilen şehir
        @Binding var ilce: String // İlçe seçimi
        var dizi: [String] // Şehir listesi (Binding değil)
        @Binding var selected: Int  // Seçili şehir indeksi
        @Binding var isSheetPresendet: Bool // Sheet'in gösterilip gösterilmeyeceği
    var body: some View {
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
                    TextField("Meslek Ara",text: $meslekara)
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
                    
                    List(0..<dizi.count, id: \.self) { item in
                        ZStack{
                            HStack(alignment: .center, spacing: 5) {
                                Text(dizi[item])
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
                        sehir = dizi[selectedOption]
                        selected = selectedOption
                    }
                    ilce = "Seçiniz"
                    isSheetPresendet = false
                    
                } label: {
                    
                    Text("Seçimi Uygula")
                        .modifier(buttonBlue())
                }
                Button{} label : {
                    Text("Vazgeç")
                        .modifier(buttonStroke())
                        .padding(.bottom)
                }
               
                
                
            }
          
            
        }
        //                    .frame(height: 300) // Sheet’in yüksekliğini sabitler
        .presentationDetents([.height(700)]) // Sheet yüksekliğini orta boyutta tutar
        .presentationDragIndicator(.hidden)
    }
}

