//
//  IntExtension.swift
//  Group9_W2020_MAD3115_FP
//
//  Created by adithyasai neeli on 2020-03-15.
//  Copyright © 2020 adithyasai neeli. All rights reserved.
//

import Foundation
extension Int{

        func calculateAge(birthDate: Date) -> Int {
            let now = Date()
            return Calendar.current.dateComponents([.year], from: birthDate, to: now).year ?? 0
        }
       
    
    func calculateDays(startDate: String,endDate: String)->Int{
        
           // date1 = Date(fromString: startDate, format: .isoDate)
            
          //  date2 = Date(fromString: endDate, format: .isoDate)
         //   return Calendar.current.dateComponents([.day], from: date1, to: date2).day ?? 0
        let s = startDate
        let e = endDate
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy MM dd"
        let date1 = formatter.date(from: s)
        let date2 = formatter.date(from: e)
         return Calendar.current.dateComponents([.day], from: date1!, to: date2!).day ?? 0
    }
    
        func dollar()->String
        {
            return "$\(self).00"
            
        }
}

