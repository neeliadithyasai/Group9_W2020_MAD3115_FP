//
//  Customer.swift
//  Group9_W2020_MAD3115_FP
//
//  Created by adithyasai neeli on 2020-03-15.
//  Copyright © 2020 adithyasai neeli. All rights reserved.
//

import Foundation

class Customer : Person
{
   
     var Id:String
     var firstName:String
     var lastName:String
    var fullName : String
       {
           return "\(firstName) \(lastName)"
       }
     var gender: Gender
     var birthDate:Date
     lazy var age:Int = calculatedAge()
     var mobileNumber:String
     var emailId:String
     var userName:String
     var password:String
     var address:String
     var city:String
     lazy var vehicleRent = [String:VehicleRent]()

init(Id:String,firstName:String,lastName:String,gender: Gender,birthDate:Date,mobileNumber:String,emailId:String,userName:String,password:String,address: String,city:String) throws
     {
       self.Id=Id
       self.firstName=firstName
       self.lastName=lastName
       self.gender=gender
       self.birthDate=birthDate
      // self.age =
        guard   mobileNumber.count == 10 else {
                throw mobileCount.invalidMobile(error: "\(mobileNumber)")
        }
        self.mobileNumber=mobileNumber
        guard emailId.isValidEmail(email: emailId) else {
            throw validEmail.invalidEmail(error: "\(emailId)")
        }
        self.emailId=emailId
       self.userName=userName
       self.password=password
       self.address = address
       self.city=city
        // self.vehicleRent=vehicleRent
    }
    
    func calculatedAge() -> Int{
        var a = 0
        a = a.calculateAge(birthDate: birthDate)
        return a
    }
       
    func encryption(encrypt: String) -> String {
                    let d = encrypt.data(using: .utf8)
                  //  let a = d?.sha256()
                    let str = String(decoding: (d?.sha256())!, as: UTF8.self)
                    return str
        }
        
    func decryption(decrypt: String) ->String{
       
        let d = decrypt.data(using: .utf8)
        //  let a = d?.sha256()
          let str = String(decoding: (d?.sha256())!, as: UTF8.self)
          return str
    }
    
     func display()
      {
           print("***********  CUSTOMER'S INFORMATION  ***********")
           print("Full name     :   \(self.fullName)")
           print("Gender        :   \(self.gender)")
           let str = birthDate.formatDate(date: birthDate)
           print("BirthDate     :   \(str)")
           print("Age is        :   \(calculatedAge())")
           print("Mobile number :   \(self.mobileNumber)")
           print("Email Id      :   \(self.emailId)")
           print("Username      :   \(self.userName)")
           print("Password      :   \(encryption(encrypt: password))")
//           if encryption(encrypt: password) == decryption(decrypt: password){
//           print("Original Password : \(password)")
//        }
           print("Address       :   \(self.address)")
           print("City          :   \(self.city)")
            for (_,v) in vehicleRent{
                v.display()
            }
    }
    }
