//
//  SignUp_1_2ViewModel.swift
//  gedik_yatirim
//
//  Created by Hasan on 18.08.2024.
//

import Foundation


class SignUp_1_2ViewModel : ObservableObject{
    @Published var showAlert : Bool = false
    @Published var alertMessage : String = ""
    @Published var isNavigationActive: Bool = false // Sayfa yönlendirme kontrolü
//    @Binding  var phoneNumber : String
//    @Published  var phoneNumber : String
    @Published  var permission = false
    @Published  var tcKimlikNumarasi = ""
    @Published  var permission2 = false

    
    @Published var phoneNumber  : String = ""
    
    

    
    func validate() {
        print("\(phoneNumber)")
       alertMessage = ""
        
       if (tcKimlikNumarasi.count != 11)
        {
           alertMessage = "Lütfen 11 haneli TC Kimlik Numaranızı Giriniz. "
          
           showAlert = true
           isNavigationActive = false // Geçişi engelle
           
       } else{
           //isNavigationActive = true
           if (permission2 == false )
            {
               alertMessage = "Lütfen Açık Rıza Metnini Okuyunuz."
              
               showAlert = true
               isNavigationActive = false // Geçişi engelle
               
           } else{
               if (phoneNumber.first != "5")
                {
                   alertMessage = "Lütfen Geçerli Cep Telefonu Numarası giriniz."
                  
                   showAlert = true
                   isNavigationActive = false // Geçişi engelle
                   
               } else{
//                   let digits = tcKimlikNumarasi.compactMap { Int(String($0)) }
//                   let eleventhDigit = (digits[0] + digits[1] + digits[2] + digits[3] + digits[4] + digits[5] + digits[6] + digits[7] + digits[8] + digits[9]) % 10
                   if (validateCitizenshipID(ID: tcKimlikNumarasi) == false)
                    {
                       alertMessage = "Lütfen Geçerli bir Tc Kimlik Numarası giriniz."
                      
                       showAlert = true
                       isNavigationActive = false // Geçişi engelle
                       
                   } else{
                       isNavigationActive = true
                   }
               }
           }
       }
   }
    
    
    
    func validateCitizenshipID(ID: String) -> Bool {
        let digits = ID.compactMap({ $0.wholeNumberValue })
        
        if digits.count == 11 && digits.first != 0 {
            let first   = (digits[0] + digits[2] + digits[4] + digits[6] + digits[8]) * 7
            let second  = (digits[1] + digits[3] + digits[5] + digits[7])
            
            let digit10 = (first - second) % 10
            let digit11 = (digits[0] + digits[1] + digits[2] + digits[3] + digits[4] + digits[5] + digits[6] + digits[7] + digits[8] + digits[9]) % 10
            
            if (digits[10] == digit11) && (digits[9] == digit10) {
                return true
            }
        }
        return false
    }

    
    init() {}
}
