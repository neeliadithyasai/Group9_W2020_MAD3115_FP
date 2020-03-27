//
//  VehicleDisplayViewController.swift
//  Group9_W2020_MAD3115_FP
//
//  Created by Mohit Kumar on 2020-03-27.
//  Copyright © 2020 adithyasai neeli. All rights reserved.
//

import UIKit

class VehicleDisplayViewController: UIViewController {

    var car : Car?
    var motorcycle : Motorcycle?
    var bus : Bus?
    var index : Int?
    
    @IBOutlet weak var lblVehicle: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let vin = car?.vin, let vd = car?.vehicle_description, let mn = car?.manufacturer_name, let dr = car?.driver, let sd = car?.is_self_drive, let ip = car?.insurance_provider, let ft = car?.fuel_type, let cc = car?.carColor, let ct = car?.carType, let se = car?.seats, let br = car?.base_rate, let rpk = car?.rate_per_km{
            if sd == true{
            lblVehicle.text = "Identification Number : \(vin)\n\nDescription : \(vd)\n\nManufacturer : \(mn)\n\nDriver : \(dr)\n\nSelf Drive Available : Yes\n\nInsurance Provider : \(ip)\n\nFuel Type : \(ft)\n\nColor : \(cc)\n\nType : \(ct)\n\nNumber of Seats : \(se)\n\nBase Rate : \(br)\n\nRate Per Km : \(rpk)"
        }
            else {
                lblVehicle.text = "Identification Number : \(vin)\n\nDescription : \(vd)\n\nManufacturer : \(mn)\n\nDriver : \(dr)\n\nSelf Drive Available : No\n\nInsurance Provider : \(ip)\n\nFuel Type : \(ft)\n\nColor : \(cc)\n\nType : \(ct)\n\nNumber of Seats : \(se)\n\nBase Rate : \(br)\n\nRate Per Km : \(rpk)"
            }
        }

}
    
    
    
    
    

}
