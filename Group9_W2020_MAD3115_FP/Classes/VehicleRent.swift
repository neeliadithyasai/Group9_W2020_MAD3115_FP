//
//  VehicleRent.swift
//  Group9_W2020_MAD3115_FP
//
//  Created by adithyasai neeli on 2020-03-15.
//  Copyright © 2020 adithyasai neeli. All rights reserved.
//

import Foundation
class VehicleRent: DisplayDelegate{
 
    var rent_start: String
    var rent_end: String
    lazy var no_of_days: Int = totalDays()
    var vehicle: String
    lazy var vRented = [String : Vehicle]()
    var distance_km: Int
    lazy var total_bill: Int =  totalBill()
    
    
    init(rent_start: String, rent_end: String, vehicle: String, distance_km: Int) {
        self.rent_start = rent_start
        self.rent_end = rent_end
        self.distance_km = distance_km
        self.vehicle = vehicle
    }
    
    func totalDays()->Int
    {
        var a = 0
        a = a.calculateDays(startDate: rent_start, endDate: rent_end)
        return a
    }
   
    func totalBill() -> Int {
        var a = 0
        if vehicle.lowercased() == "car"
        {
            a = 100 + ( 5 * distance_km )
            return a
        }
      else if vehicle.lowercased() == "motorcycle"
        {
            a = 50 + distance_km
            return a
        }
        else {
        
            a = 250 + ( 7 * distance_km)
            return a
        
        }
        
    }

    func display() {
        print("\t\t\t-----------------------VEHICLE RENT------------------------")
        print("\t\t\tVehicle's Rent Start Date              :   \(self.rent_start)")
        print("\t\t\tVehicle's Rent End Date                :   \(self.rent_end)")
        print("\t\t\tVehicle Rented                         :   \(self.vehicle)")
        print("\t\t\tVehicle's Rent in number of days       :   \(self.no_of_days)")
        print("\t\t\tVehicle's number of kilometers drived  :   \(self.distance_km)")
        print("\t\t\tTotal bill is                          :   \(self.total_bill.dollar())")
        for a in vRented{
            a.value.display()
        }
    }
    
    
}

