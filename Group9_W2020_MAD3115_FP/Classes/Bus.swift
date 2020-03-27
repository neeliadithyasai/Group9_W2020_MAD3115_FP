//
//  Bus.swift
//  Group9_W2020_MAD3115_FP
//
//  Created by adithyasai neeli on 2020-03-15.
//  Copyright © 2020 adithyasai neeli. All rights reserved.
//

import Foundation

class Bus: Vehicle{
    
    var vin: String
    var vehicle_description: String
    var manufacturer_name: String
    var is_self_drive: Bool
    var driver: String
    var is_insured: Bool
    var insurance_provider: String
    var seats: String
    var fuel_type: Fuel
    var base_rate: Int = 250
    var rate_per_km: Int = 7
    var busType: String
    var accessibility_service_available: Bool
    var wifi_available: Bool
    
    init(vin: String, vehicle_description: String, manufacturer_name: String, is_self_drive: Bool, driver: String, is_insured: Bool, insurance_provider: String, seats: String, fuel_type: Fuel, busType: String, accessibility_service_available: Bool, wifi_available: Bool) {
        self.vin = vin
        self.vehicle_description = vehicle_description
        self.manufacturer_name = manufacturer_name
        self.is_self_drive = is_self_drive
        self.driver = driver
        self.is_insured = is_insured
        self.insurance_provider = insurance_provider
        self.seats = seats
        self.fuel_type = fuel_type
        
        self.busType = busType
        self.accessibility_service_available = accessibility_service_available
        self.wifi_available = wifi_available
    }
    
    
    
    
    func display() {
        print("\t\t\t------------------------ BUS DETAILS-------------------------- ")
        print("\t\t\tVehicle Insurance Number is               :     \(self.vin)")
        print("\t\t\tDescription is                            :     \(self.vehicle_description)")
        print("\t\t\tManufacturer is                           :     \(self.manufacturer_name)")
        print("\t\t\tAvailable for self drive                  :     \(self.is_self_drive)")
        print("\t\t\tDriver is                                 :     \(self.driver)")
        print("\t\t\tCar is insured?                           :     \(self.is_insured)")
        print("\t\t\tInsurance Provider is                     :     \(self.insurance_provider)")
        print("\t\t\tNumber of seats in the Bus are            :     \(self.seats)")
        print("\t\t\tFuel type                                 :     \(self.fuel_type)")
        print("\t\t\tBase rate is                              :     \(self.base_rate.dollar())")
        print("\t\t\tPer km price                              :     \(self.rate_per_km.dollar())")
        print("\t\t\tType of Bus                               :     \(self.busType)")
        print("\t\t\tIs accessibility serivice available in Bus:     \(self.accessibility_service_available)")
        print("\t\t\tIs wifi available                         :     \(self.wifi_available)")
        
    }
    
}
