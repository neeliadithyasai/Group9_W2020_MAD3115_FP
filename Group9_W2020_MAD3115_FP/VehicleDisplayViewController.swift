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
        
            lblVehicle.text = "Identification Number : \(vin)\n\nDescription : \(vd)\n\nManufacturer : \(mn)\n\nDriver : \(dr)\n\nSelf Drive Available : \(sd ? "Yes" : "No")\n\nInsurance Provider : \(ip)\n\nFuel Type : \(ft)\n\nColor : \(cc)\n\nType : \(ct)\n\nNumber of Seats : \(se)\n\nBase Rate : \(br)\n\nRate Per Km : \(rpk)"
                lblVehicle.numberOfLines = 0
                lblVehicle.font = UIFont.boldSystemFont(ofSize: 12)
                lblVehicle.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
                lblVehicle.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        }

            
        else if let vin = bus?.vin, let vd = bus?.vehicle_description, let mn = bus?.manufacturer_name, let dr = bus?.driver, let sd = bus?.is_self_drive, let ip = bus?.insurance_provider, let ft = bus?.fuel_type, let asa = bus?.accessibility_service_available, let bt = bus?.busType, let se = bus?.seats, let br = bus?.base_rate, let rpk = bus?.rate_per_km, let wifi = bus?.wifi_available{
        
            lblVehicle.text = "Identification Number : \(vin)\n\nDescription : \(vd)\n\nManufacturer : \(mn)\n\nDriver : \(dr)\n\nSelf Drive Available : Yes\n\nInsurance Provider : \(ip)\n\nFuel Type : \(ft)\n\nAccessibility Service Available : \(asa ? "Yes" : "No")\n\nType : \(bt)\n\nNumber of Seats : \(se)\n\nBase Rate : \(br)\n\nRate Per Km : \(rpk)\n\nWifi Available : \(wifi ?  "Yes" : "No")"
                lblVehicle.numberOfLines = 0
                lblVehicle.font = UIFont.boldSystemFont(ofSize: 12)
                lblVehicle.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
                lblVehicle.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        }
        
    }
}
