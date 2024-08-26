//
//  SignUp-1ViewModel.swift
//  gedik_yatirim
//
//  Created by Hasan on 6.08.2024.
//

import Foundation
 

class SignUp_1ViewViewModel : ObservableObject {
    @Published var phoneNumber : String = ""
    @Published var showAlert : Bool = false
    @Published var alertMessage : String = ""
    @Published var isNavigationActive: Bool = false // Sayfa yönlendirme kontrolü
    init(){}
    
    func SignUp(){
    
        validatePhoneNumber()
    }
    func filter(){
        let filtered = phoneNumber.filter { "0123456789".contains($0) }
  
        if filtered.count <= 10 {
            phoneNumber = filtered
        } else {
            phoneNumber = String(filtered.prefix(10))
        }
    }

    
    
     func validatePhoneNumber() {
        alertMessage = ""
        if (phoneNumber.count != 10)
         {
            alertMessage = "Lütfen 10 haneli telefon numaranızı giriniz."
           
            showAlert = true
            isNavigationActive = false // Geçişi engelle
            
        } else{
            isNavigationActive = true 
        }
            
            
    
    }
}
