//
//  Driver.swift
//  Group9_W2020_MAD3115_FP
//
//  Created by adithyasai neeli on 2020-03-15.
//  Copyright © 2020 adithyasai neeli. All rights reserved.
//

import Foundation

class Driver: Person{
    
    var Id: String
    var firstName: String
    var lastName: String
    var fullName : String
    {
        return "\(firstName) \(lastName)"
    }
    var gender: Gender
    var birthDate: Date
    lazy var age:Int = calculatedAge()
    var mobileNumber: String
    var emailId: String
    var userName: String
    var password: String
    var driverLicenceNumber: String;
    var driverHistoryClear: Bool;
    var salary: Double;
    
    init(Id: String, firstName: String, lastName: String, gender: Gender, birthDate: Date, mobileNumber: String, emailId: String, userName: String, password: String, driverLicenceNumber: String, driverHistoryClear: Bool, salary: Double)throws {
        self.Id = Id
        self.firstName = firstName
        self.lastName = lastName
        self.gender = gender
        self.birthDate = birthDate
        guard   mobileNumber.count == 10 else {
                throw mobileCount.invalidMobile(error: "\(mobileNumber)")
        }
        self.mobileNumber = mobileNumber
        guard emailId.isValidEmail(email: emailId) else {
            throw validEmail.invalidEmail(error: "\(emailId)")
        }
        self.emailId = emailId
        self.userName = userName
        self.password = password
        self.driverLicenceNumber = driverLicenceNumber
        self.driverHistoryClear = driverHistoryClear
        self.salary = salary
    }
    
    func calculatedAge() -> Int{
        var a = 0
        a = a.calculateAge(birthDate: birthDate)
        return a
    }
    
    
    func encryption(encrypt: String) -> String {
            let d = encrypt.data(using: .ascii)
          
            let str = String(decoding: (d?.sha256())!, as: UTF8.self)
            return str
}
    func decryption(decrypt: String) ->String{
       
        let d = decrypt.data(using: .ascii)
        //  let a = d?.sha256()
          let str = String(decoding: (d?.sha256())!, as: UTF8.self)
          return str
    }
    
    func display() {
        
               print("\t\t\t***********  Driver's INFORMATION  ***********");
               print("\t\t\tID : \(self.Id)")
               print("\t\t\tFull name : \(self.fullName)")
//               print("Last name : \(String(describing: self.lastName))")
               print("\t\t\tGender : \(self.gender)")
               print("\t\t\tBirthdate : \(self.birthDate)")
               print("\t\t\tAge is : \(calculatedAge())")
               print("\t\t\tMobile number : \(self.mobileNumber)")
               print("\t\t\tEmail Id : \(self.emailId)")
               print("\t\t\tUsername : \(self.userName)")
               print("\t\t\tPassword : \(encryption(encrypt: password))")
        //           if encryption(encrypt: password) == decryption(decrypt: password){
        //           print("Original Password : \(password)")
        //        }
               print("\t\t\tDriving License number is : \(driverLicenceNumber)")
               if driverHistoryClear {
                   print("\t\t\tDriving history is clear ")
               }
               else{
               print("\t\t\tDriving history is not satisfactory")
                }
               print("\t\t\tDriver's Salary is : \(salary)");
    }
}
