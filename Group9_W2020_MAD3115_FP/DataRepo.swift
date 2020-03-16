//
//  DataRepo.swift
//  Group9_W2020_MAD3115_FP
//
//  Created by adithyasai neeli on 2020-03-15.
//  Copyright © 2020 adithyasai neeli. All rights reserved.
//

import Foundation
class DataRepo{
   static private var repo = DataRepo()
   
    private lazy var vehicleDictionary = Dictionary<String, Vehicle>()
    private lazy var ownerVehicle = Dictionary<String, Array<Vehicle>>()
    private var customerList = Dictionary<String,Customer>()
    private lazy var driverList = Dictionary<String, Driver>()
    private lazy var customerVehicleRent = Dictionary<String, Array<VehicleRent>>()
    
    
    private init() {
        
    }
   static func getInstance() -> DataRepo{
        return repo
    }
    func addVehicleToCustomer(customer: Customer, vehicle: Array<VehicleRent>){
        self.customerVehicleRent.updateValue(vehicle, forKey: customer.Id)
    }
    func addVehicle(vehicle: Vehicle){
        self.vehicleDictionary.updateValue(vehicle, forKey: vehicle.manufacturer_name.lowercased())
    }
    func getVehicle(carName: String) -> Vehicle?{
        self.vehicleDictionary[carName]
    }
    func addCustomer(customer:Customer)
    {
        self.customerList.updateValue(customer, forKey: customer.Id)
    }
    func addOwnerVehicle(owner:Owner,vehicle:Array<Vehicle>)
    {
        self.ownerVehicle.updateValue(vehicle,forKey: owner.Id)
    }
    func addDriver(driver:Driver, vehicle: Vehicle){
        self.driverList.updateValue(driver, forKey: vehicle.manufacturer_name)
    }
//    funcdisplayAllVehicleRent(){
//
//    }
    
    
    func displayAllVehicles()
    {
        for (_,v) in vehicleDictionary
        {
          
            v.display()
        }
    }
    func displayAllRentedVehicles(){
        for (_,v) in customerVehicleRent{
         
            for a in v{
                a.display()
            }
        }
    }
    func displayAllOwners(){
        for (_,v) in ownerVehicle
        {
           
            for a in v{
                a.display()
         }
    }
}
        
    func displayAllCustomer(){
        for (_,v) in customerList{
                
                v.display()
            }
        }
   
    func displayAllDriver(){
        for(_,v) in driverList{
            
            v.display()
        }
    }
    
    func getDriverById(Id: String){
        for (_,v) in driverList{
            if Id == v.Id{
                v.display()
            }
        }
    }
    
    func getCustomerById(Id: String){
        for (_,v) in customerList{
            if Id == v.Id{
                v.display()
            }
        }
    }
}
