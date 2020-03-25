//
//  File.swift
//  Group9_W2020_MAD3115_FP
//
//  Created by adithyasai neeli on 2020-03-15.
//  Copyright © 2020 adithyasai neeli. All rights reserved.
//

import Foundation
extension Date
{
    static func daysBetween(start: Date, end: Date) -> Int {
           let calendar = Calendar.current

           // Replace the hour (time) of both dates with 00:00
           let date1 = calendar.startOfDay(for: start)
           let date2 = calendar.startOfDay(for: end)

           let a = calendar.dateComponents([.day], from: date1, to: date2)
        return a.value(for: .day)!}
        
    func formatDate(date : Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd MMMM yyyy"
        return dateFormatter.string(from: date)
    }
    
    func formatToDate() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEEE, dd MMMM, yyyy"
        return dateFormatter.string(from: self)
    }
    
}
