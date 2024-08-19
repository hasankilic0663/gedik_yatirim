//
//  LogInViewModel.swift
//  gedik_yatirim
//
//  Created by Hasan on 6.08.2024.
//

import Foundation

class LogInViewModel :ObservableObject{
    @Published var tckn  = ""
    @Published var password = ""
    @Published var errorMessage = ""
    init(){}
    
    func login(){
        guard validate() else{
            return
        }
    }
    func  validate() -> Bool{
        errorMessage = ""
        
        if !tckn.trimmingCharacters(in: .whitespaces).isEmpty && tckn.count == 11 {
            
        }
                
        else{
            errorMessage  = "Lütfen tüm alanları doldurun "
            return false
        }
        if !password.trimmingCharacters(in: .whitespaces).isEmpty {
            
        }
                
        else{
            errorMessage  = "Lütfen Geçerli bişr şifre giriniz. "
            return false
        }
        return true
    }
    
    func filter(){
        // Harfleri ve özel karakterleri filtrele
        let filtered = tckn.filter { "0123456789".contains($0) }
        // Karakter sayısını 11 ile sınırla
        if filtered.count <= 11 {
            tckn = filtered
        } else {
            tckn = String(filtered.prefix(11))
        }
    }
    
}
