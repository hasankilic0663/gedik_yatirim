//
//  IncomeInf_2ViewModel.swift
//  gedik_yatirim
//
//  Created by Hasan on 23.08.2024.
//

import Foundation

class IncomeInf_2ViewModel : ObservableObject {
    
    @Published var currentStep : Int = 2
    @Published var isSheetNema : Bool = false
    @Published var isSheetEkstre : Bool = false
    @Published var selectedOption: Int? = nil
    @Published var selectedOption2: Int? = nil
    @Published var nemaText = "İstiyorum"
    @Published var selected : Int = 0
    @Published var ekstreText = "Posta"
    @Published var textIban = ""
    @Published var errorActive: [Bool] = [false, false, false, false] //

    var nema = ["İstiyorum", "İstemiyorum"]
    var ekstre = ["Elektronik Ortam","E-Posta","Posta"]
    init( ){ }
}
