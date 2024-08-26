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
    @Published var errorActive: [Bool] = [false, false, false, false]
    @Published var errorMessage: [String] = ["", "", "", ""] 

    
    
    func validationPerson(){
       
        if firstName.trimmingCharacters(in: .whitespaces).isEmpty || containsInvalidCharacters(in: firstName) {
            errorMessage[0] = "İsim Alanına Unicode Karakterler Girilemez"
            errorActive[0] = true
        }
        else{
            errorActive[0] = false
        }

                // Soyad doğrulaması
        if lastName.trimmingCharacters(in: .whitespaces).isEmpty || containsInvalidCharacters(in: lastName) {
            
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
    
    
    
    
    private func containsInvalidCharacters(in text: String) -> Bool {
        let allowedCharacterSet = CharacterSet(charactersIn: "abcdefghijklmnopqrstuvwxyzçğıöşüABCDEFGHIJKLMNOPQRSTUVWXYZÇĞİÖŞÜ ")
        let decimalCharacters = CharacterSet.decimalDigits
        
        // Türkçe karakterler ve İngilizce harfler dışında veya sayı varsa true döner
        for scalar in text.unicodeScalars {
            if !allowedCharacterSet.contains(scalar) || decimalCharacters.contains(scalar) {
                return true
            }
        }
        return false
    }
        
//        private func containsNumericCharacters(in text: String) -> Bool {
//            let decimalCharacters = CharacterSet.decimalDigits
//            return text.rangeOfCharacter(from: decimalCharacters) != nil
//        }
        
    
        private func isValidDateFormat(dateString: String) -> Bool {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "dd/MM/yyyy"
            return dateFormatter.date(from: dateString) != nil
        }
    
    init(){

    }
}
