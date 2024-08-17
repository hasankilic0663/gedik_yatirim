//
//  Filter.swift
//  gedik_yatirim
//
//  Created by Hasan on 16.08.2024.
//

import Foundation

@Binding var tckn : String = ""

struct Filter {
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
