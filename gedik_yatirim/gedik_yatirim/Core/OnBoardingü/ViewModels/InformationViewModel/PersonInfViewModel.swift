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
    
    init(){

    }
}
