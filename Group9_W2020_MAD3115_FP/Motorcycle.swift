//
//  Motorcycle.swift
//  Group9_W2020_MAD3115_FP
//
//  Created by adithyasai neeli on 2020-03-15.
//  Copyright © 2020 adithyasai neeli. All rights reserved.
//

import Foundation

class Motorcycle: Vehicle{
    

    var vin: String
    var vehicle_description: String
    var manufacturer_name: String
    var is_self_drive: Bool
    var driver: String
    var is_insured: Bool
    var insurance_provider: String
    var seats: String
    var fuel_type: Fuel
    var base_rate: Int = 50
    var rate_per_km: Int = 1
    var maxSpeed: Int
    var mileage: Int
    
    
    init(vin: String, vehicle_description: String, manufacturer_name: String, is_self_drive: Bool, driver: String, is_insured: Bool, insurance_provider: String, seats: String, fuel_type: Fuel,  maxSpeed: Int ,mileage: Int) {
        self.vin = vin
        self.vehicle_description = vehicle_description
        self.manufacturer_name = manufacturer_name
        self.is_self_drive = is_self_drive
        self.driver = driver
        self.is_insured = is_insured
        self.insurance_provider = insurance_provider
        self.seats = seats
        self.fuel_type = fuel_type
       // self.base_rate = base_rate
       // self.rate_per_km = rate_per_km
        self.maxSpeed = maxSpeed
        self.mileage = mileage
    }
    
    func display() {
        print("\t\t\t------------------- MOTORCYCLE DETAILS--------------------- ")
        print("\t\t\tVehicle Insurance Number is    :   \(self.vin)")
        print("\t\t\tDescription is                 :   \(self.vehicle_description)")
        print("\t\t\tManufacturer is                :   \(self.manufacturer_name)")
        print("\t\t\tAvailable for self drive       :   \(self.is_self_drive)")
        print("\t\t\tDriver is                      :   \(self.driver)")
        print("\t\t\tCar is insured?                :   \(self.is_insured)")
        print("\t\t\tInsurance Provider is          :   \(self.insurance_provider)")
        print("\t\t\tNumber of seats in the car are :   \(self.seats)")
        print("\t\t\tMaximum speed is               :   \(self.maxSpeed)")
        print("\t\t\tMileage is                     :   \(self.mileage)")
        print("\t\t\tFuel type                      :   \(self.fuel_type)")
        print("\t\t\tBase rate                      :   \(self.base_rate.dollar())")
        print("\t\t\tPer km price                   :   \(self.rate_per_km.dollar())")
    }
}
