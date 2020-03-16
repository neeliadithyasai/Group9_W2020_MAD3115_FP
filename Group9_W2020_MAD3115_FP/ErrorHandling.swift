//
//  ErrorHandling.swift
//  Group9_W2020_MAD3115_FP
//
//  Created by adithyasai neeli on 2020-03-15.
//  Copyright © 2020 adithyasai neeli. All rights reserved.
//

import Foundation

enum validEmail: Error{
    case invalidEmail(error : String)
}
enum mobileCount: Error{
    case invalidMobile(error: String)
}
