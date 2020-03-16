//
//  Owner.swift
//  Group9_W2020_MAD3115_FP
//
//  Created by adithyasai neeli on 2020-03-15.
//  Copyright © 2020 adithyasai neeli. All rights reserved.
//

import Foundation

class Owner : Person
   {

    
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
            var companyTitle:String
            var businessLandLineNumber:String
            lazy var vehicleList = [String:Vehicle]()
            var website:String

    init(Id:String,firstName:String,lastName:String,gender: Gender,birthDate:Date,mobileNumber:String,emailId:String,userName:String,password:String,companyTitle:String, businessLandLineNumber:String, website:String) throws
          {
            self.Id=Id
            self.firstName=firstName
            self.lastName=lastName
            self.gender=gender
            self.birthDate=birthDate
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
            self.companyTitle=companyTitle
            self.businessLandLineNumber = businessLandLineNumber
            self.website=website
              
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
          let str = String(decoding: (d?.sha256())!, as: UTF8.self)
          return str
    }
    
    
      func display() {
                print("\t\t***********  OWNER'S INFORMATION  ***********")
                print("\t\tFull name : \(self.fullName)")
                print("\t\tGender : \(self.gender)")
                let str = birthDate.formatDate(date: birthDate)
                print("\t\tBirthdate : \(str)")
                print("\t\tAge is \(calculatedAge())")
                print("\t\tMobile number : \(self.mobileNumber)")
                print("\t\tEmail Id : \(self.emailId)")
                print("\t\tUsername : \(self.userName)")
                print("\t\tPassword : \(encryption(encrypt: password))")
        //           print("Password : \(encryption(encrypt: password))")
        //           if encryption(encrypt: password) == decryption(decrypt: password){
        //           print("Original Password : \(password)")
        //        }
                print("\t\tCompany title : \(self.companyTitle)")
                print("\t\tBusiness Landline number : \(self.businessLandLineNumber)")
                print("\t\tWebsite : \(self.website)")
                print("\t\t-------- LIST OF VEHICLES --------")
                print("         ***************************************************")
        for (_,v) in vehicleList{
            v.display()
        }
                
           }
    }

