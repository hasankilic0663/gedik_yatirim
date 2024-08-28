import SwiftUI

struct VerificationViewss: View {
    @State private var code: [String] = Array(repeating: "", count: 6)
    @FocusState private var focusedField: Int?
    @State private var remainingTime = 90
    @State private var isButtonActive = false
    
    var body: some View {
        VStack(spacing: 20) {
            HStack(spacing: 10) {
                ForEach(0..<6, id: \.self) { index in
                    TextField("", text: $code[index])
                        .multilineTextAlignment(.center)
                        .frame(width: 40, height: 40)
                        .background(Color.gray.opacity(0.2))
                        .cornerRadius(8)
                        .keyboardType(.numberPad)
                        .focused($focusedField, equals: index)
                        .onChange(of: code[index]) { newValue in
                            if newValue.count == 1 {
                                if index < 5 {
                                    focusedField = index + 1
                                } else {
                                    focusedField = nil // Son textfield'a geldiğinde odaklanmayı kaldır
                                }
                            }
                        }
                }
            }
            .padding()

            Text("Kalan süre: \(remainingTime) saniye")
                .font(.headline)

            Button(action: {
                // Kod gönderme işlemi
                remainingTime = 90
                isButtonActive = false
                startTimer()
            }) {
                Text("Yeniden Kod Gönder")
                    .padding()
                    .background(isButtonActive ? Color.blue : Color.gray)
                    .foregroundColor(.white)
                    .cornerRadius(8)
            }
            .disabled(!isButtonActive)

            Spacer()
        }
        .onAppear {
            startTimer()
            focusedField = 0 // Ekran açıldığında ilk TextField'a odaklan
        }
    }
    
    private func startTimer() {
        Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { timer in
            if remainingTime > 0 {
                remainingTime -= 1
            } else {
                timer.invalidate()
                isButtonActive = true
            }
        }
    }
}

struct VerificationView_Previewss: PreviewProvider {
    static var previews: some View {
        VerificationView()
    }
}
