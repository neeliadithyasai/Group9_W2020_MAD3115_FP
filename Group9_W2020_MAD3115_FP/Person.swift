//
//  Person.swift
//  Group9_W2020_MAD3115_FP
//
//  Created by adithyasai neeli on 2020-03-15.
//  Copyright © 2020 adithyasai neeli. All rights reserved.
//

import Foundation
enum Gender
{
    case Male,Female,Other
}

protocol Person
{
    var Id:String{ get}
    var firstName:String{get }
    var lastName:String{get}
    var gender: Gender{get}
    var birthDate:Date{get}
    var age:Int{get}
    var mobileNumber:String{get set}
    var emailId:String{get set}
    var userName:String{get set}
    var password:String{get }
    
    func display()
}

