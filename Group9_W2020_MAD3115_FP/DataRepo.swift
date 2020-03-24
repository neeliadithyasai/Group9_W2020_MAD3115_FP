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
    let calendar = Calendar.current
    private lazy var customers : [Customer] = []
    private lazy var owners : [Owner] = []
    private lazy var drivers : [Driver] = []
    private lazy var cars : [Vehicle] = []
    private lazy var buses : [Vehicle] = []
    private lazy var motorcycles : [Vehicle] = []
   private lazy var ownerVehicle = Dictionary<String, Array<Vehicle>>()
      private lazy var driverList = Dictionary<String, Driver>()
    private init(){
        
    }
    static func getInstance()->DataRepo{
        return repo
    }
    
    func addCustomer(customer: Customer){
        self.customers.append(customer)
    }
    func getAllCustomers()->[Customer]{
        return self.customers
    }
    func addowner(owner: Owner){
        self.owners.append(owner)
    }
    func getAllOwners()->[Owner]{
        return self.owners
    }
    func addriver(driver: Driver){
        self.drivers.append(driver)
    }
    func getAlldrivers()->[Driver]{
        return self.drivers
    }
    func addcar(car: Vehicle){
        self.cars.append(car)
    }
    func getAllCars()->[Vehicle]{
        return self.cars
    }
    func addbus(bus: Vehicle){
        self.buses.append(bus)
    }
    func getAllbuses()->[Vehicle]{
        return self.buses
    }
    func addmotorcycle(motorcycle: Vehicle){
        self.motorcycles.append(motorcycle)
    }
    func getAllmotorcycles()->[Vehicle]{
        return self.motorcycles
    }
    func addOwnerVehicle(owner:Owner,vehicle:Array<Vehicle>)
     {
         self.ownerVehicle.updateValue(vehicle,forKey: owner.Id)
     }
    func addDriver(driver:Driver, vehicle: Vehicle){
           self.driverList.updateValue(driver, forKey: vehicle.manufacturer_name)
       }
 
    
    
    
    
   
    
    func loadCustomers()
    {
        do{
            //customer object created
            let date1 = DateComponents( year: 1995, month: 07, day: 28)
            let id1 = calendar.date(from: date1)
            let C1 = try Customer(Id: "C001", firstName: "Adithya", lastName: "Neeli", gender: Gender.Male, birthDate: id1!, mobileNumber: "8695246488", emailId: "neeliadithyasai@gmail.com", userName: "adithya28 ", password: "Adi@123", address: "10 Grenoble Drive", city: "Toronto")
            customers.append(C1)
            
            let date2 = DateComponents( year: 1993, month: 04, day: 21)
            let id2 = calendar.date(from: date2)
            let C2 = try Customer(Id: "C002", firstName: "Zach", lastName: "Knight", gender: Gender.Male, birthDate: id2!, mobileNumber: "8022345678", emailId: "zachknhigt@gmail.com", userName: "imknight ", password: "zach678", address: "10 Wynford Drive", city: "Scarborough")
            
            customers.append(C2)
            
            
            
            let date3 = DateComponents( year: 1998, month: 01, day: 20)
            let id3 = calendar.date(from: date3)
            let C3 = try Customer(Id: "C003", firstName: "Steven", lastName: "joy", gender: Gender.Male, birthDate: id3!, mobileNumber: "6543367239", emailId: "stevenjoy@gmail.com", userName: "sjoy39 ", password: "h67y3d", address: "25 Idlewilde hall", city: "Toronto")
            customers.append(C3)
            
            let date4 = DateComponents( year: 1996, month: 12, day: 06)
            let id4 = calendar.date(from: date4)
            let C4 = try Customer(Id: "C004", firstName: "Anusuya", lastName: "pandey", gender: Gender.Female, birthDate: id4!, mobileNumber: "8695746523", emailId: "pandeyanusuya@yahoo.com", userName: "anusuya345 ", password: "anusuya12345", address: "23 Kennedy Road", city: "Richmond")
            customers.append(C4)
            
            let date5 = DateComponents( year: 1998, month: 11, day: 25)
            let id5 = calendar.date(from: date5)
            
            let C5 = try Customer(Id: "C005", firstName: "Ananya", lastName: "kumari", gender: Gender.Female, birthDate: id5!, mobileNumber: "7856488835", emailId: "ananyakumari@yahoo.com", userName: "ananya ", password: "anusuya12345", address: "23 Birchmount Road", city: "Kitchner")
            customers.append(C5)
            
            //Motor cycle objects created
            var M1 : Vehicle
                   M1 = Motorcycle(vin: "ASD3245RETHFBFT6", vehicle_description: "BLACK", manufacturer_name: "Harley", is_self_drive: false, driver: "Rafael", is_insured: true, insurance_provider: "BMO", seats: "2", fuel_type: Fuel.Diesel, maxSpeed: 150, mileage: 15)
                   motorcycles.append(M1)
                   
                   
                   var M2 : Vehicle
                   M2 = Motorcycle(vin: "GD57GHAHYEJHJF8J",vehicle_description:"Red", manufacturer_name: "Honda", is_self_drive: false, driver: "Heath", is_insured: true, insurance_provider: "Andrea company", seats: "2",fuel_type: Fuel.Diesel, maxSpeed: 134, mileage: 34)
                   motorcycles.append(M2)
                   
                   
                   var M3 : Vehicle
                   M3 = Motorcycle(vin: "JWU63GF37HGD74H",vehicle_description:"Yellow", manufacturer_name: "KTM",is_self_drive:false, driver: "Loki", is_insured:false, insurance_provider: "Toronto Insurance", seats: "2",fuel_type: Fuel.Petrol,maxSpeed: 103, mileage : 25)
                   motorcycles.append(M3)
                   
                   
                   var M4 : Vehicle
                   M4 = Motorcycle(vin:"HJEH7833HJHD7HD",vehicle_description:"Green", manufacturer_name: "Suzuki",is_self_drive:false, driver:"Rahul", is_insured: true,insurance_provider: "Mukul Inc.",seats:"2",fuel_type: .Electric,maxSpeed:120, mileage:35)
                   motorcycles.append(M4)
                   
                   
                   var M5 : Vehicle
                   M5 = Motorcycle(vin:"73YEH73E3YUUIEE",vehicle_description:"Black", manufacturer_name: "Yamaha",is_self_drive:true, driver:"Steeve", is_insured:true,insurance_provider:"Canada Trust",seats:"2",fuel_type: .Diesel,maxSpeed:182,mileage:67)
                   motorcycles.append(M5)
            
            // created bus objects
            
            var B1 : Vehicle
                  B1 = Bus(vin: "WAUCFAFH4CN679337", vehicle_description: "Spacious", manufacturer_name: "Goshen", is_self_drive: false, driver: "John", is_insured: true, insurance_provider: "TD Bank", seats: "50", fuel_type: Fuel.Diesel, busType: "Mini", accessibility_service_available: true, wifi_available: true)
                  buses.append(B1)
                  
                  var B2 : Vehicle
                  B2 = Bus(vin: "WBA4B1C54FG794331", vehicle_description: "Small", manufacturer_name: "Federal", is_self_drive: false, driver: "Max", is_insured: true, insurance_provider: "Alpha insurance", seats: "77", fuel_type: Fuel.Electric, busType: "Volvo", accessibility_service_available: true, wifi_available: true)
                  buses.append(B2)
                  
                  var B3 : Vehicle
                  B3 = Bus(vin: "WBASP0C59DC982947", vehicle_description: "Large", manufacturer_name: "Champion", is_self_drive: false, driver: "Kiara", is_insured: false, insurance_provider: "ICICI", seats: "80", fuel_type: Fuel.Petrol, busType: "MiniCoach", accessibility_service_available: true, wifi_available: false)
                  buses.append(B3)
                  
                  var B4 : Vehicle
                  B4 = Bus(vin: "BHA562H176716H176", vehicle_description: "Spacious", manufacturer_name: "Eldorado", is_self_drive: false, driver: "Chris", is_insured: false, insurance_provider: "Toronto group", seats: "25", fuel_type: .Electric, busType: "Volvo", accessibility_service_available: true, wifi_available: true)
                  buses.append(B4)
                  
                  var B5 : Vehicle
                  B5 = Bus(vin: "NBHQWG677637HGH67", vehicle_description: "Roomy", manufacturer_name: "Krystal", is_self_drive: false, driver: "Rakesh", is_insured: false, insurance_provider: "Canada Trust", seats: "44", fuel_type: .Diesel, busType: "Mini", accessibility_service_available: false, wifi_available: true)
                  buses.append(B5)
            
            //created car objects
            
            var Car1 : Vehicle
                   Car1 = Car(vin: "WBA3A5C55CF202202", vehicle_description: "Sports Car", manufacturer_name: "Audi", is_self_drive: true, driver: "Donald", is_insured: true, insurance_provider: "Scotia Bank", seats: "5", fuel_type: Fuel.Diesel,  carType: "Sedan", carColor: "black")
                   cars.append(Car1)
                   
                   var Car2 : Vehicle
                   Car2 = Car(vin: "5N1CR2MNXEC181212", vehicle_description: "perfect", manufacturer_name: "Mercedes", is_self_drive: false, driver: "Niang", is_insured: true, insurance_provider: "Allstate", seats: "7", fuel_type: Fuel.Petrol,  carType: "SUV", carColor: "white")
                   cars.append(Car2)
                   
                   var Car3 : Vehicle
                   Car3 = Car(vin: "WAUUL98EX8A747315", vehicle_description: "Old", manufacturer_name: "Hyundai", is_self_drive: true, driver: "Shaun", is_insured: true, insurance_provider: "TD", seats: "5", fuel_type: Fuel.Diesel,  carType: "Hatchback", carColor: "red")
                   cars.append(Car3)
                   
                   var Car4 : Vehicle
                   Car4 = Car(vin: "ZHWGU5BZ0CL457896", vehicle_description: "Comfortable", manufacturer_name: "Toyota", is_self_drive: true, driver: "Nadal", is_insured: true, insurance_provider: "Scotia", seats: "9", fuel_type: Fuel.Petrol,  carType: "MPV", carColor: "black")
                   cars.append(Car4)
                   
                   var Car5 : Vehicle
                   Car5 = Car(vin: "WAU4FAFL0AA424617", vehicle_description: "Royal", manufacturer_name: "BMW", is_self_drive: false, driver: "Djokovic", is_insured: false, insurance_provider: "BMO", seats: "2", fuel_type: Fuel.Electric,  carType: "Sedan", carColor: "grey")
                   cars.append(Car5)
            
            //created driver objects
            
            let D1date = DateComponents( year: 1980, month: 10, day: 15)
            let D1date1 = calendar.date(from: D1date)
            let D1 = try Driver(Id: "D01", firstName: "Ben", lastName: "Slate", gender: Gender.Male, birthDate: D1date1!, mobileNumber: "5496467890", emailId: "slate123ben@yahoo.com", userName: "ben12345", password: "slate09", driverLicenceNumber: "DL579390375", driverHistoryClear: true, salary: 5000.0)
            drivers.append(D1)
            let D2date = DateComponents( year: 1993, month: 02, day: 18)
            let D2date1 = calendar.date(from: D2date)
            let D2 = try Driver(Id: "D02", firstName: "Andrew", lastName: "Finn", gender: Gender.Male, birthDate: D2date1!, mobileNumber: "9823745740", emailId: "finnand@gmail.com", userName: "finnandr1", password: "andr321", driverLicenceNumber: "DL745279864760", driverHistoryClear: true, salary: 8000.0)
            drivers.append(D2)
            
            let D3date = DateComponents( year: 1981, month: 06, day: 23)
            let D3date1 = calendar.date(from: D3date)
            let D3 = try Driver(Id: "D03", firstName: "Tina", lastName: "Stone", gender: Gender.Female, birthDate: D3date1!, mobileNumber: "6783745740", emailId: "stone67890@gmail.com", userName: "myselftina", password: "stoned", driverLicenceNumber: "DL784669374", driverHistoryClear: true, salary: 10000.0)
            drivers.append(D3)
            let D4date = DateComponents( year: 1995, month: 12, day: 25)
            let D4date1 = calendar.date(from: D4date)
            let D4 = try Driver(Id: "D04", firstName: "Sara", lastName: "Paul", gender: Gender.Female, birthDate: D4date1!, mobileNumber: "7893427310", emailId: "paulsara@icloud.com", userName: "saradriver", password: "paulst123", driverLicenceNumber: "DL780427548", driverHistoryClear: true, salary: 6000.0)
            drivers.append(D4)
            
            //created owner objects
            let O1date = DateComponents( year: 1995, month: 11, day: 20)
            let O1date1 = calendar.date(from: O1date)
            let O1 = try Owner(Id: "OW111", firstName: "Steve", lastName: "King", gender: Gender.Male, birthDate: O1date1!, mobileNumber: "9878678412", emailId: "kingsteve@gmail.com", userName: "iamking", password: "kings7890", companyTitle: "King Cars", businessLandLineNumber: "2227848", website: "kingcars.com")
            
            owners.append(O1)
            
            addOwnerVehicle(owner: O1, vehicle: [Car1,M1,B1])
            O1.vehicleList = ["O1" : Car1, "02" : M1,"03" : B1]
           
            
            
            let O2date = DateComponents( year: 1988, month: 04, day: 12)
            let O2date1 = calendar.date(from: O2date)
            let O2 = try Owner(Id: "OW112", firstName: "Kelly", lastName: "Harper", gender: Gender.Female, birthDate: O2date1!, mobileNumber: "9085637265", emailId: "kellyhere@hotmail.com", userName: "kelper", password: "harpe8r33", companyTitle: "Kelly's World", businessLandLineNumber: "2834520", website: "worldofkelly.com")
                 owners.append(O2)
            addOwnerVehicle(owner: O2, vehicle: [Car2, M2, B2] )
            O2.vehicleList = ["O1" : Car2, "02" : M2, "03" : B2]
            
       
            let O3date = DateComponents( year: 1990, month: 08, day: 20)
            let O3date1 = calendar.date(from: O3date)
            let O3 = try Owner(Id: "OW113", firstName: "Roger", lastName: "Federer", gender: Gender.Male, birthDate: O3date1!, mobileNumber: "7875623402", emailId: "rf21@gmail.com", userName: "federerr", password: "swinggg", companyTitle: "Hotshot Cars", businessLandLineNumber: "597350", website: "World of cars")
            
            owners.append(O3)
          addOwnerVehicle(owner: O3, vehicle: [M3,Car3,B3] )
               O3.vehicleList = ["01" : M3,"02" : Car3,"03" : B3]
            
            let O4date = DateComponents( year: 1991, month: 11, day: 02)
            let O4date1 = calendar.date(from: O4date)
            let O4 = try Owner(Id: "OW114", firstName: "Tommy", lastName: "Shelby", gender: Gender.Male, birthDate: O4date1!, mobileNumber: "6475406638", emailId: "shelbytom@gmail.com", userName: "shelby4u", password: "cross987", companyTitle: "Shelby Enterprises", businessLandLineNumber: "984538", website: "shelbyenterprises.com")
            owners.append(O4)
            addOwnerVehicle(owner: O4, vehicle: [Car4, Car5, B4] )
            O4.vehicleList = ["01" : Car4,"02" : Car5,"03" : B4]
            
            let O5date = DateComponents( year: 1992, month: 07, day: 08)
            let O5date1 = calendar.date(from: O5date)
            let O5 = try Owner(Id: "OW115", firstName: "Sienna", lastName: "Watson", gender: Gender.Female, birthDate: O5date1!, mobileNumber: "6475109839", emailId: "sienna78watson@gmail.com", userName: "watson90", password: "siena123", companyTitle: "Sienna Wheels", businessLandLineNumber: "983785", website: "siennaonwheels")
            owners.append(O5)
            addOwnerVehicle(owner: O5, vehicle: [B4,M4,M5] )
            O5.vehicleList = ["01" : M5,"02" : M5,"03" : B4]
            
            
        }
        catch validEmail.invalidEmail(error: "email"){
            print("invalid email ")
        }
        catch mobileCount.invalidMobile(let error){
            print("invalid mobile : \(error)")
        }
        catch{
            print("some error")
        }
        
    }
    
}
