//
//  IncomeInfViewModel.swift
//  gedik_yatirim
//
//  Created by Hasan on 23.08.2024.
//

import Foundation

class IncomeInfViewModel : ObservableObject {
    
    
    @Published var currentStep : Int = 2
  
    @Published var isSheetPresendetmeslek : Bool = false
    @Published var isSheetPresendetgelir : Bool = false
    @Published var isSheetPresendetKaynak : Bool = false
    @Published var isSheetPresendetBirikim : Bool = false
    @Published var selectedOptionjob: Int? = nil
    @Published var meslekText = "Tasarımcı"
    @Published var gelirText = "₺25.001 - ₺50.000"
    @Published var kaynakText = "Maaş"
    @Published var birikimtext = "₺0 - 150.0000"
    @Published var selected : Int = 0
    @Published var errorActive: [Bool] = [false, false, false, false] // Hata durumları
    @Published var errorMessage: [String] = ["", "", "", ""] // Hata mesajları

    @Published var meslekara = ""
    
    var meslekler = ["Akademisyen/Öğr.Gör.","Analist/Programcı" ,"Astsubay","Aşçı/Garson/Barmen" ,"Avukat","Bankacı",  "Büyük Sanayici","Çalışmayan"]
    var gelir = ["₺0 - ₺15.000","₺15.001 - ₺25.000","₺25.001 - ₺50.000 ","₺50.001 üzeri"]
    init(){ }
    
}
