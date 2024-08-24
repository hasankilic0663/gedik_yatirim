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
    @Published var errorActive : Bool = true
    @Published var errorMessage = ""

    
    func validationPerson(){
        
        if email.trimmingCharacters(in: .whitespaces).isEmpty {
            errorMessage = "Geçerli bir Email adresi giriniz."
            errorActive = false
        }
        else{
            errorActive = true
        }
        if email.contains("@") && email.contains(".") {
            errorMessage = "Geçerli birsdaasdasdEmail adresi giriniz."
            errorActive = false
        }else{
            errorActive = true
        }
        
        
        
        
        
        
        
        
    }
    
    init(){

    }
}
