import SwiftUI

struct VerificationView: View {
    @State private var code = Array(repeating: "", count: 6) // 6 haneli kod için boş bir dizi
    @State private var currentIndex = 0 // Şu anki aktif TextField'ın indexi
    @State private var timeRemaining = 90 // Geri sayım için 90 saniye
    @State private var resendButtonEnabled = false // Yeniden Kod Gönder butonunun durumu
    @State private var timer: Timer?

    var body: some View {
        VStack(spacing: 20) {
            Text("Doğrulama Kodu")
                .font(.title)
            
            HStack(spacing: 10) {
                ForEach(0..<6, id: \.self) { index in
                    TextField("", text: $code[index])
                        .frame(width: 40, height: 40)
                        .multilineTextAlignment(.center)
                        .keyboardType(.numberPad)
                        .background(Color.gray.opacity(0.2))
                        .cornerRadius(8)
                        .onChange(of: code[index]) { newValue in
                            if newValue.count > 1 {
                                code[index] = String(newValue.prefix(1))
                            }
                            if !newValue.isEmpty && currentIndex < 5 {
                                currentIndex += 1
                            }
                        }
                        .focused($currentIndex, equals: index)
                }
            }
            
            Text("Süre: \(timeRemaining) saniye")
                .font(.subheadline)
                .foregroundColor(.gray)
            
            Button(action: resendCode) {
                Text("Yeniden Kod Gönder")
                    .foregroundColor(.blue)
                    .padding()
                    .background(resendButtonEnabled ? Color.blue.opacity(0.1) : Color.gray.opacity(0.1))
                    .cornerRadius(8)
            }
            .disabled(!resendButtonEnabled)

            Spacer()
        }
        .padding()
        .onAppear {
            startTimer()
        }
    }

    func startTimer() {
        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { _ in
            if timeRemaining > 0 {
                timeRemaining -= 1
            } else {
                resendButtonEnabled = true
                timer?.invalidate()
            }
        }
    }

    func resendCode() {
        // Yeniden kod gönderme işlemi (statik olarak)
        code = Array(repeating: "", count: 6)
        currentIndex = 0
        timeRemaining = 90
        resendButtonEnabled = false
        startTimer()
    }
}

extension View {
    func focused(_ index: Binding<Int>, equals: Int) -> some View {
        self.onAppear {
            if equals == index.wrappedValue {
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                    UIApplication.shared.sendAction(#selector(UIResponder.becomeFirstResponder), to: nil, from: nil, for: nil)
                }
            }
        }
    }
}

struct VerificationView_Previews: PreviewProvider {
    static var previews: some View {
        VerificationView()
    }
}
