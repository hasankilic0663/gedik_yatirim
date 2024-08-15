import SwiftUI
import UIKit

// 1 karakter sınırlaması ile UITextField kullanımı
struct OneTimeCodeTextField: UIViewRepresentable {
    @Binding var text: String
    var onCommit: () -> Void = {}
    
    func makeUIView(context: Context) -> UITextField {
        let textField = UITextField()
        textField.keyboardType = .numberPad
        textField.textAlignment = .center
        textField.delegate = context.coordinator
        return textField
    }

    func updateUIView(_ uiView: UITextField, context: Context) {
        uiView.text = text
    }

    func makeCoordinator() -> Coordinator {
        return Coordinator(self)
    }
    
    class Coordinator: NSObject, UITextFieldDelegate {
        var parent: OneTimeCodeTextField

        init(_ parent: OneTimeCodeTextField) {
            self.parent = parent
        }

        // Maksimum bir karakter kontrolü burada yapılır
        func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
            let currentText = textField.text ?? ""
            let newText = (currentText as NSString).replacingCharacters(in: range, with: string)
            
            if newText.count <= 1 {
                parent.text = newText
                if newText.count == 1 {
                    parent.onCommit() // Eğer karakter sayısı 1 olursa, bir sonraki field'a geçiş yapılır
                }
                return true
            } else {
                return false // 1 karakterden fazlasına izin verilmiyor
            }
        }
    }
}

struct OTPVerificationView: View {
    @State private var otpFields = Array(repeating: "", count: 6) // 6 haneli doğrulama kodu için
    @FocusState private var focusedField: Int? // Hangi alanın odakta olduğunu kontrol eder
    @State private var remainingTime = 90 // 90 saniye geri sayım süresi
    @State private var timer: Timer?

    var body: some View {
        VStack {
            Spacer()
            
            Text("Devam edebilmemiz için cep telefonunuza gönderdiğimiz doğrulama kodunu giriniz.")
                .multilineTextAlignment(.center)
                .padding()
            
            HStack(spacing: 10) {
                ForEach(0..<6) { index in
                    OneTimeCodeTextField(text: $otpFields[index], onCommit: {
                        moveToNextField(from: index)
                    })
                    .frame(width: 40, height: 40)
                    .multilineTextAlignment(.center)
                    .focused($focusedField, equals: index) // Odaklanan TextField'ı kontrol eder
                    .background(RoundedRectangle(cornerRadius: 5).stroke(focusedField == index ? Color.blue : Color.gray, lineWidth: 2))
                }
            }
            
            Text("Kalan Süre: \(remainingTime / 60):\(String(format: "%02d", remainingTime % 60))")
                .padding()
            
            Button("Yeni Kod Gönder") {
                resetTimer()
            }
            .disabled(remainingTime > 0) // Geri sayım bitmeden buton devre dışı
            
            Spacer()
        }
        .onAppear {
            startTimer()
            focusedField = 0 // İlk TextField'a odaklan
        }
    }
    
    // Bir sonraki TextField'a geçişi sağlar
    private func moveToNextField(from index: Int) {
        if index < 5 {
            focusedField = index + 1
        } else {
            focusedField = nil // Son alana geldiysek, odak kaldırılır
            submitOTP()
        }
    }
    
    // Girilen kodu birleştirip işleme gönderir
    private func submitOTP() {
        let otpCode = otpFields.joined()
        print("Girilen OTP kodu: \(otpCode)")
    }

    // Geri sayımı başlatır
    private func startTimer() {
        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { _ in
            if remainingTime > 0 {
                remainingTime -= 1
            } else {
                timer?.invalidate()
            }
        }
    }
    
    // Geri sayımı sıfırlar ve yeniden başlatır
    private func resetTimer() {
        remainingTime = 90
        startTimer()
    }
}

struct OTPVerificationView_Previews: PreviewProvider {
    static var previews: some View {
        OTPVerificationView()
    }
}
