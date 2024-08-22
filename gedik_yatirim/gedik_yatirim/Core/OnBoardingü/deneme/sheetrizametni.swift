import SwiftUI
struct CustomCheckboxToggleStyle: ToggleStyle {
    func makeBody(configuration: Configuration) -> some View {
        HStack {
            configuration.label
            Spacer()
            Button(action: {
                configuration.isOn.toggle()
            }) {
                Image(systemName: configuration.isOn ? "checkmark.square" : "square")
                    .resizable()
                    .frame(width: 20, height: 20)
            }
        }
    }
}
struct rizametni: View {
    @State private var isSheetPresented = false
    @State private var isScrolledToEnd = false
    @State private var buttonEnabled = false

    var body: some View {
        VStack {
            Toggle(isOn: $isSheetPresented) {
                Text("Açık Rıza Metnini Okudum")
            }
            .toggleStyle(CustomCheckboxToggleStyle())
            .sheet(isPresented: $isSheetPresented) {
                ConsentSheetView(isScrolledToEnd: $isScrolledToEnd, buttonEnabled: $buttonEnabled)
            }

            Button(action: {
                // Butonun işlevi burada olacak
            }) {
                Text("Onaylıyorum")
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(buttonEnabled ? Color.blue : Color.gray)
                    .foregroundColor(.white)
                    .cornerRadius(8)
            }
            .disabled(!buttonEnabled)
        }
        .padding()
    }
}

#Preview {
    rizametni()
}
struct ConsentSheetView: View {
    @Binding var isScrolledToEnd: Bool
    @Binding var buttonEnabled: Bool

    var body: some View {
        VStack {
            if !isScrolledToEnd {
                Text("Sözleşmeyi okumak ve onaylamak için aşağı kaydırın")
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.blue)
                    .cornerRadius(8)
                    .padding(.bottom, 10)
            }

            ScrollView {
                Text("Lorem ipsum dolor sit amet consectetur adipiscing elit... (Uzun metin burada yer alacakLorem ipsum dolor sit amet consectetur adipiscing elit... (Uzun metin burada yer alacakLorem ipsum dolor sit amet consectetur adipiscing elit... (Uzun metin burada yer alacakLorem ipsum dolor sit amet consectetur adipiscing elit... (Uzun metin burada yer alacakLorem ipsum dolor sit amet consectetur adipiscing elit... (Uzun metin burada yer alacakLorem ipsum dolor sit amet consectetur adipiscing elit... (Uzun metin burada yer alacakLorem ipsum dolor sit amet consectetur adipiscing elit... (Uzun metin burada yer alacakLorem ipsum dolor sit amet consectetur adipiscing elit... (Uzun metin burada yer alacakLorem ipsum dolor sit amet consectetur adipiscing elit... (Uzun metin burada yer alacakLorem ipsum dolor sit amet consectetur adipiscing elit... (Uzun metin burada yer alacakLorem ipsum dolor sit amet consectetur adipiscing elit... (Uzun metin burada yer alacakLorem ipsum dolor sit amet consectetur adipiscing elit... (Uzun metin burada yer alacakLorem ipsum dolor sit amet consectetur adipiscing elit... (Uzun metin burada yer alacakLorem ipsum dolor sit amet consectetur adipiscing elit... (Uzun metin burada yer alacakLorem ipsum dolor sit amet consecteturLorem ipsum dolor sit amet consectetur adipiscing elit... (Uzun metin burada yer alacakLorem ipsum dolor sit amet consectetur adipiscing elit... (Uzun metin burada yer alacakLorem ipsum dolor sit amet consectetur adipiscing elit... (Uzun metin burada yer alacakLorem ipsum dolor sit amet consectetur adipiscing elit... (Uzun metin burada yer alacakLorem ipsum dolor sit amet consectetur adipiscing elit... (Uzun metin burada yer alacakLorem ipsum dolor sit amet consectetur adipiscing elit... (Uzun metin burada yer alaLorem ipsum dolor sit amet consectetur adipiscing elit... (Uzun metin burada yer alacakLorem ipsum dolor sit amet consectetur adipiscing elit... (Uzun metin burada yer alacakLorem ipsum dolor sit amet consectetur adipiscing elit... (Uzun metin burada yer alacakLorem ipsum dolor sit amet consectetur adipiscing elit... (Uzun metin burada yer alacakLorem ipsum dolor sit amet consectetur adipiscing elit... (Uzun metin burada yer alacakLorem ipsum dolor sit amet consectetur adipiscing elit... (Uzun metin burada yer alacakLorem ipsum dolor sit amet consectetur adipiscing elit... (Uzun metin burada yer alacakLorem ipsum dolor sit amet consectetur adipiscing elit... (Uzun metin burada yer alacakLorem ipsum dolor sit amet consectetur adipiscing elit... (Uzun metin burada yer alacakLorem ipsum dolor sit amet consectetur adipiscing elit... (Uzun metin burada yer alacakLorem ipsum dolor sit amet consectetur adipiscing elit... (Uzun metin burada yer alacakLorem ipsum dolor sit amet consectetur adipiscing elit... (Uzun metin burada yer alacakLorem ipsum dolor sit amet consectetur adipiscing elit... (Uzun metin burada yer alacakLorem ipsum dolor sit amet consectetur adipiscing elit... (Uzun metin burada yer alacakLorem ipsum dolor sit amet consectetur adipiscing elit... (Uzun metin burada yer alacakLorem ipsum dolor sit amet consectetur adipiscing elit... (Uzun metin burada yer alacakLorem ipsum dolor sit amet consectetur adipiscing elit... (Uzun metin burada yer alacakLorem ipsum dolor sit amet consectetur adipiscing elit... (Uzun metin burada yer alacakLorem ipsum dolor sit amet consectetur adipiscing elit... (Uzun metin burada yer alacakLorem ipsum dolor sit amet consectetur adipiscing elit... (Uzun metin burada yer alacakLorem ipsum dolor sit amet consectetur adipiscing elit... (Uzun metin burada yer alacakLorem ipsum dolor sit amet consectetur adipiscing elit... (Uzun metin burada yer alacakLorem ipsum dolor sit amet consectetur adipiscing elit... (Uzun metin burada yer alacakLorem ipsum dolor sit amet consectetur adipiscing elit... (Uzun metin burada yer alacakLorem ipsum dolor sit amet consectetur adipiscing elit... (Uzun metin burada yer alacakLorem ipsum dolor sit amet consectetur adipiscing elit... (Uzun metin burada yer alacakLorem ipsum dolor sit amet consectetur adipiscing elit... (Uzun metin burada yer alacakLorem ipsum dolor sit amet consectetur adipiscing elit... (Uzun metin burada yer alacakLorem ipsum dolor sit amet consectetur adipiscing elit... (Uzun metin burada yer alacakLorem ipsum dolor sit amet consectetur adipiscing elit... (Uzun metin burada yer alacakLorem ipsum dolor sit amet consectetur adipiscing elit... (Uzun metin burada yer alacakLorem ipsum dolor sit amet consectetur adipiscing elit... (Uzun metin burada yer alacakLorem ipsum dolor sit amet consectetur adipiscing elit... (Uzun metin burada yer alacakLorem ipsum dolor sit amet consectetur adipiscing elit... (Uzun metin burada yer alacakLorem ipsum dolor sit amet consectetur adipiscing elit... (Uzun metin burada yer alacakLorem ipsum dolor sit amet consectetur adipiscing elit... (Uzun metin burada yer alacakLorem ipsum dolor sit amet consectetur adipiscing elit... (Uzun metin burada yer alacakLorem ipsum dolor sit amet consectetur adipiscing elit... (Uzun metin burada yer alacakLorem ipsum dolor sit amet consectetur adipiscing elit... (Uzun metin burada yer alacakLorem ipsum dolor sit amet consectetur adipiscing elit... (Uzun metin burada yer alacakLorem ipsum dolor sit amet consectetur adipiscing elit... (Uzun metin burada yer alacakLorem ipsum dolor sit amet consectetur adipiscing elit... (Uzun metin burada yer alacakLorem ipsum dolor sit amet consectetur adipiscing elit... (Uzun metin burada yer alacakLorem ipsum dolor sit amet consectetur adipiscing elit... (Uzun metin burada yer alacakLorem ipsum dolor sit amet consectetur adipiscing elit... (Uzun metin burada yer alacakLorem ipsum dolor sit amet consectetur adipiscing elit... (Uzun metin burada yer alacakLorem ipsum dolor sit amet consectetur adipiscing elit... (Uzun metin burada yer alacakLorem ipsum dolor sit amet consectetur adipiscing elit... (Uzun metin burada yer alacakLorem ipsum dolor sit amet consectetur adipiscing elit... (Uzun metin burada yer alacakLorem ipsum dolor sit amet consectetur adipiscing elit... (Uzun metin burada yer alacakLorem ipsum dolor sit amet consectetur adipiscing elit... (Uzun metin burada yer alacakLorem ipsum dolor sit amet consectetur adipiscing elit... (Uzun metin burada yer alacakLorem ipsum dolor sit amet consectetur adipiscing elit... (Uzun metin burada yer alacakLorem ipsum dolor sit amet consectetur adipiscing elit... (Uzun metin burada yer alacakLorem ipsum dolor sit amet consectetur adipiscing elit... (Uzun metin burada yer alacakcakLorem ipsum dolor sit amet consectetur adipiscing elit... (Uzun metin burada yer alacakLorem ipsum dolor sit amet consectetur adipiscing elit... (Uzun metin burada yer alacakLorem ipsum dolor sit amet consectetur adipiscing elit... (Uzun metin burada yer alacakLorem ipsum dolor sit amet consectetur adipiscing elit... (Uzun metin burada yer alacakLorem ipsum dolor sit amet consectetur adipiscing elit... (Uzun metin burada yer alacakLorem ipsum dolor sit amet consectetur adipiscing elit... (Uzun metin burada yer alacakLorem ipsum dolor sit amet consectetur adipiscing elit... (Uzun metin burada yer alacakLorem ipsum dolor sit amet consectetur adipiscing elit... (Uzun metin burada yer alacakLorem ipsum dolor sit amet consectetur adipiscing elit... (Uzun metin burada yer alacakLorem ipsum dolor sit amet consectetur adipiscing elit... (Uzun metin burada yer alacakLorem ipsum dolor sit amet consectetur adipiscing elit... (Uzun metin burada yer alacakLorem ipsum dolor sit amet consectetur adipiscing elit... (Uzun metin burada yer alacakLorem ipsum dolor sit amet consectetur adipiscing elit... (Uzun metin burada yer alacakLorem ipsum dolor sit amet consectetur adipiscing elit... (Uzun metin burada yer alacakLorem ipsum dolor sit amet consectetur adipiscing elit... (Uzun metin burada yer alacakLorem ipsum dolor sit amet consectetur adipiscing elit... (Uzun metin burada yer alacakLorem ipsum dolor sit amet consectetur adipiscing elit... (Uzun metin burada yer alacakLorem ipsum dolor sit amet consectetur adipiscing elit... (Uzun metin burada yer alacakLorem ipsum dolor sit amet consectetur adipiscing elit... (Uzun metin burada yer alacakLorem ipsum dolor sit amet consectetur adipiscing elit... (Uzun metin burada yer alacakLorem ipsum dolor sit amet consectetur adipiscing elit... (Uzun metin burada yer alacakLorem ipsum dolor sit amet consectetur adipiscing elit... (Uzun metin burada yer alacakLorem ipsum dolor sit amet consectetur adipiscing elit... (Uzun metin burada yer alacakLorem ipsum dolor sit amet consectetur adipiscing elit... (Uzun metin burada yer alacakLorem ipsum dolor sit amet consectetur adipiscing elit... (Uzun metin burada yer alacakLorem ipsum dolor sit amet consectetur adipiscing elit... (Uzun metin burada yer alacakLorem ipsum dolor sit amet consectetur adipiscing elit... (Uzun metin burada yer alacakLorem ipsum dolor sit amet consectetur adipiscing elit... (Uzun metin burada yer alacakLorem ipsum dolor sit amet consectetur adipiscing elit... (Uzun metin burada yer alacakLorem ipsum dolor sit amet consectetur adipiscing elit... (Uzun metin burada yer alacakLorem ipsum dolor sit amet consectetur adipiscing elit... (Uzun metin burada yer alacakLorem ipsum dolor sit amet consectetur adipiscing elit... (Uzun metin burada yer alacakLorem ipsum dolor sit amet consectetur adipiscing elit... (Uzun metin burada yer alacakLorem ipsum dolor sit amet consectetur adipiscing elit... (Uzun metin burada yer alacakLorem ipsum dolor sit amet consectetur adipiscing elit... (Uzun metin burada yer alacakLorem ipsum dolor sit amet consectetur adipiscing elit... (Uzun metin burada yer alacak adipiscing elit... (Uzun metin burada yer alacakLorem ipsum dolor sit amet consectetur adipiscing elit... (Uzun metin burada yer alacakLorem ipsum dolor sit amet consectetur adipiscing elit... (Uzun metin burada yer alacakLorem ipsum dolor sit amet consectetur adipiscing elit... (Uzun metin burada yer alacakLorem ipsum dolor sit amet consectetur adipiscing elit... (Uzun metin burada yer alacakLorem ipsum dolor sit amet consectetur adipiscing elit... (Uzun metin burada yer alacakLorem ipsum dolor sit amet consectetur adipiscing elit... (Uzun metin burada yer alacakLorem ipsum dolor sit amet consectetur adipiscing elit... (Uzun metin burada yer alacakLorem ipsum dolor sit amet consectetur adipiscing elit... (Uzun metin burada yer alacakLorem ipsum dolor sit amet consectetur adipiscing elit... (Uzun metin burada yer alacakLorem ipsum dolor sit amet consectetur adipiscing elit... (Uzun metin burada yer alacakLorem ipsum dolor sit amet consectetur adipiscing elit... (Uzun metin burada yer alacakLorem ipsum dolor sit amet consectetur adipiscing elit... (Uzun metin burada yer alacakLorem ipsum dolor sit amet consectetur adipiscing elit... (Uzun metin burada yer alacak)")
                    .padding()
                    .background(GeometryReader { geo -> Color in
                        let y = geo.frame(in: .global).maxY
                        DispatchQueue.main.async {
                            if y < UIScreen.main.bounds.height {
                                isScrolledToEnd = true
                                buttonEnabled = true
                            }
                        }
                        return Color.clear
                    })
            }
        }
        .padding()
    }
}
