//
//  PersonInfViewModel.swift
//  gedik_yatirim
//
//  Created by Hasan on 23.08.2024.
//

import Foundation

class PersonInfViewModel : ObservableObject{
    @Published  var firstName: String = ""
    @Published  var lastName: String = ""
    @Published  var birthDate: String = ""
    @Published  var email: String = ""
    @Published  var currentStep: Int = 1
    @Published var errorActive: [Bool] = [false, false, false, false] // Hata durumları
    @Published var errorMessage: [String] = ["", "", "", ""] // Hata mesajları

//    
//    // Doğum tarihini "dd/MM/yyyy" formatında olacak şekilde düzenleyen fonksiyon
//         func formatBirthDate() {
//            // Boşlukları kaldır
//            var digitsOnly = birthDate.filter { $0.isNumber }
//            
//            if digitsOnly.count > 8 {
//                digitsOnly = String(digitsOnly.prefix(8))
//            }
//            
//            if digitsOnly.count > 4 {
//                digitsOnly.insert("/", at: digitsOnly.index(digitsOnly.startIndex, offsetBy: 4))
//            }
//            
//            if digitsOnly.count > 2 {
//                digitsOnly.insert("/", at: digitsOnly.index(digitsOnly.startIndex, offsetBy: 2))
//            }
//            
//            birthDate = digitsOnly
//        }
    
    
    
    func validationPerson(){
       
        if firstName.trimmingCharacters(in: .whitespaces).isEmpty || containsUnicodeCharacters(in: firstName) {
            errorMessage[0] = "İsim Alanına Unicode Karakterler Girilemez"
            errorActive[0] = true
        }
        else{
            errorActive[0] = false
        }

                // Soyad doğrulaması
        if lastName.trimmingCharacters(in: .whitespaces).isEmpty || containsNumericCharacters(in: lastName) {
            
            errorMessage[1] = "Soyad Alanına Sayısal Karakterler Girilemez"
            errorActive[1] = true
        }
        else{
            errorActive[1] = false
        }

        if !isValidDateFormat(dateString: birthDate) {
            errorMessage[2] = "Doğum Tarihinizi Girmeniz Gerekmektedir."
            errorActive[2] = true
        }
        else{
            errorActive[2] = false
        }
        
        if email.trimmingCharacters(in: .whitespaces).isEmpty || !(email.contains("@") && email.contains(".")) {
            errorMessage[3] = "Geçerli Bir Email Adresi Giriniz"
            errorActive[3] = true
        }
        else{
            
                errorActive[3] = false
            
        }
    }
    
    
    
    // Unicode karakter içerip içermediğini kontrol eden fonksiyon
        private func containsUnicodeCharacters(in text: String) -> Bool {
            for scalar in text.unicodeScalars {
                if scalar.isASCII == false {
                    return true
                }
            }
            return false
        }
        
        // Sayısal karakter içerip içermediğini kontrol eden fonksiyon
        private func containsNumericCharacters(in text: String) -> Bool {
            let decimalCharacters = CharacterSet.decimalDigits
            return text.rangeOfCharacter(from: decimalCharacters) != nil
        }
        
        // Doğum tarihi formatının "dd/mm/yyyy" olup olmadığını kontrol eden fonksiyon
        private func isValidDateFormat(dateString: String) -> Bool {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "dd/MM/yyyy"
            return dateFormatter.date(from: dateString) != nil
        }
    
    init(){

    }
}
