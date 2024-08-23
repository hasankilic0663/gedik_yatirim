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
    @Published var nematext = "İstiyorum"
    @Published var ekstreText = "Posta"
    @Published var textIban = ""
    
    init( ){ }
}
