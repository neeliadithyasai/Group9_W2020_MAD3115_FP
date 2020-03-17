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
    func getAlldrivers()->[Vehicle]{
        return self.cars
    }
    
    func loadcars()
          {
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

            
    }
    
    
    func loadDrivers()
       {
        do{
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
        }
        catch validEmail.invalidEmail(let error){
            print("invalid email : \(error)")
        }
        catch mobileCount.invalidMobile(let error){
            print("invalid mobile : \(error)")
        }catch{
            print("some error")
        }
        
        
    }
    
    
    
    
    
    func loadOwners()
    {
        do{
        let O1date = DateComponents( year: 1995, month: 11, day: 20)
        let O1date1 = calendar.date(from: O1date)
        let O1 = try Owner(Id: "OW111", firstName: "Steve", lastName: "King", gender: Gender.Male, birthDate: O1date1!, mobileNumber: "9878678412", emailId: "kingsteve@gmail.com", userName: "iamking", password: "kings7890", companyTitle: "King Cars", businessLandLineNumber: "2227848", website: "kingcars.com")
            
            owners.append(O1)
        

        let O2date = DateComponents( year: 1988, month: 04, day: 12)
        let O2date1 = calendar.date(from: O2date)
            let O2 = try Owner(Id: "OW112", firstName: "Kelly", lastName: "Harper", gender: Gender.Female, birthDate: O2date1!, mobileNumber: "9085637265", emailId: "kellyhere@hotmail.com", userName: "kelper", password: "harpe8r33", companyTitle: "Kelly's World", businessLandLineNumber: "2834520", website: "worldofkelly.com")
          
            owners.append(O2)
        let O3date = DateComponents( year: 1990, month: 08, day: 20)
        let O3date1 = calendar.date(from: O3date)
        let O3 = try Owner(Id: "OW113", firstName: "Roger", lastName: "Federer", gender: Gender.Male, birthDate: O3date1!, mobileNumber: "7875623402", emailId: "rf21@gmail.com", userName: "federerr", password: "swinggg", companyTitle: "Hotshot Cars", businessLandLineNumber: "597350", website: "World of cars")

            owners.append(O3)
            
        let O4date = DateComponents( year: 1991, month: 11, day: 02)
        let O4date1 = calendar.date(from: O4date)
        let O4 = try Owner(Id: "OW114", firstName: "Tommy", lastName: "Shelby", gender: Gender.Male, birthDate: O4date1!, mobileNumber: "6475406638", emailId: "shelbytom@gmail.com", userName: "shelby4u", password: "cross987", companyTitle: "Shelby Enterprises", businessLandLineNumber: "984538", website: "shelbyenterprises.com")
            owners.append(O4)

        let O5date = DateComponents( year: 1992, month: 07, day: 08)
        let O5date1 = calendar.date(from: O5date)
        let O5 = try Owner(Id: "OW115", firstName: "Sienna", lastName: "Watson", gender: Gender.Female, birthDate: O5date1!, mobileNumber: "6475109839", emailId: "sienna78watson@gmail.com", userName: "watson90", password: "siena123", companyTitle: "Sienna Wheels", businessLandLineNumber: "983785", website: "siennaonwheels")
            owners.append(O5)
            
            }catch validEmail.invalidEmail(let error){
                print("invalid email : \(error)")
            }
            catch mobileCount.invalidMobile(let error){
                print("invalid mobile : \(error)")
            }
        catch{
            print("some error")
        }
        
        
        
        
    }
    
    func loadCustomers()
    {
        do{
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
