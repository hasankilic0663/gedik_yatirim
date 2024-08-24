//
//  PersonInf.swift
//  gedik_yatirim
//
//  Created by Hasan on 23.08.2024.
//

import Foundation


class PersonInf_2ViewModel : ObservableObject {
    
    @Published var sehir = "İstanbul"
    @Published var ilce = "Seçiniz"
    @Published var adres = ""
    @Published var meslekara = ""
    @Published var ilceara = ""
    @Published var currentStep: Int = 2
    @Published var isSheetPresendet : Bool = false
    @Published var isIlceSheetPresented : Bool = false
    @Published  var selectedOption: Int? = nil
    @Published var selectedOption2: Int? = nil
    @Published var selected : Int = 0
    @Published var errorActive: [Bool] = [false, false, false, false] //
//    @State private var selectedIlce: Int? = nil
//
    // Türkiye şehirlerini içeren bir dizi
      var sehirler = ["İstanbul", "Ankara","İzmir", "Bursa", "Antalya", "Trabzon", "Konya", "Samsun", "Kayseri","Kocaeli","Gaziantep", "Şanlıurfa", "Muğla","Manisa","Elazığ"   ]
    
    var sehirIlceDizisi: [[String]] = [
        [
            "Adalar", "Arnavutköy", "Ataşehir", "Avcılar", "Bağcılar", "Bahçelievler", "Bakırköy", "Başakşehir", "Bayrampaşa", "Beşiktaş",
            "Beykoz", "Beylikdüzü", "Beyoğlu", "Büyükçekmece", "Çatalca", "Çekmeköy", "Esenler", "Esenyurt", "Eyüpsultan", "Fatih",
            "Gaziosmanpaşa", "Güngören", "Kadıköy", "Kağıthane", "Kartal", "Küçükçekmece", "Maltepe", "Pendik", "Sancaktepe", "Sarıyer",
            "Silivri", "Sultanbeyli", "Sultangazi", "Şile", "Şişli", "Tuzla", "Ümraniye", "Üsküdar", "Zeytinburnu"
        ],
            ["Çankaya", "Keçiören", "Mamak"],
            ["İzmir", "Konak", "Karşıyaka", "Bornova"]
        ]
    
    
    init(){}
}
