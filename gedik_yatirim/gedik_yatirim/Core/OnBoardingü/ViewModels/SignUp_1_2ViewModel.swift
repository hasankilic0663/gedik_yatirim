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
    

    func validatePhoneNumber() {
       alertMessage = ""
       if (tcKimlikNumarasi.count != 11)
        {
           alertMessage = "Lütfen 10 haneli TC Kimlik Numaranızı Giriniz "
          
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
               if (alertMessage.count != 10)
                {
                   alertMessage = "Lütfen 10 haneli telefon numaranızı giriniz."
                  
                   showAlert = true
                   isNavigationActive = false // Geçişi engelle
                   
               } else{
                   if (alertMessage.count != 10)
                    {
                       alertMessage = "Lütfen 10 haneli telefon numaranızı giriniz."
                      
                       showAlert = true
                       isNavigationActive = false // Geçişi engelle
                       
                   } else{
                       isNavigationActive = true
                   }
               }
           }
       }
        
        
      
        
        
        
       
        
        
        
           
           
   
   }

    
    init() {}
}
