//
//  Vehicle.swift
//  Group9_W2020_MAD3115_FP
//
//  Created by adithyasai neeli on 2020-03-15.
//  Copyright © 2020 adithyasai neeli. All rights reserved.
//

import Foundation

enum Fuel
{
    case Diesel, Petrol, Electric
}

protocol Vehicle: DisplayDelegate {
   
    var vin: String { get }
    var vehicle_description: String { get set }
    var manufacturer_name: String { get set }
    var is_self_drive: Bool { get  }
    var driver: String { get set }
    var is_insured: Bool { get  }
    var insurance_provider: String { get set }
    var seats: String { get set }
    var fuel_type: Fuel { get set }
    var base_rate: Int { get set }
    var rate_per_km: Int { get set }
    
    func display()
    
}
