//
//  AddNewMotorcycleViewController.swift
//  Group9_W2020_MAD3115_FP
//
//  Created by Mohit Kumar on 2020-03-27.
//  Copyright © 2020 adithyasai neeli. All rights reserved.
//

import UIKit

class AddNewMotorcycleViewController: UIViewController {
    
    @IBOutlet weak var motorcycleVin: UITextField!
    
    @IBOutlet weak var motorcycleDescription: UITextField!
    
    @IBOutlet weak var motorcycleManufacturer: UITextField!
    
    @IBOutlet weak var motorcycleSeats: UITextField!
    
    @IBOutlet weak var motorcycleFuel: UITextField!
    
    @IBOutlet weak var motorcycleSelfDrive: UITextField!
    
    @IBOutlet weak var motorcycleInsured: UITextField!
    
    @IBOutlet weak var motorcycleMaxSpeed: UITextField!
    
    @IBOutlet weak var motorcycleMileage: UITextField!
    
    @IBOutlet weak var motorcycleInsuranceProvider: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    
    @IBAction func saveMotorcycle(_ sender: UIButton) {
        
        if let cv = motorcycleVin.text, let cd = motorcycleDescription.text, let cm = motorcycleManufacturer.text, let cs = motorcycleSeats.text, let mms = motorcycleMaxSpeed.text, let mm = motorcycleMileage.text, let ci = motorcycleInsured.text, let cf = motorcycleFuel.text, let csd = motorcycleSelfDrive.text, let cip = motorcycleInsuranceProvider.text{
            if cv == "" || cd == "" || cm == "" || cs == "" || mm == "" || mms == "" || ci == "" || cf == "" || csd == "" || cip == ""{
                let alertController = UIAlertController(title: "ERROR", message:
                    "Incomplete Form", preferredStyle: .alert)
                alertController.addAction(UIAlertAction(title: "Dismiss", style: .default))
                
                self.present(alertController, animated: true, completion: nil)
            }
            else{
                DataRepo.getInstance().addmotorcycle(motorcycle: Motorcycle(vin: cv, vehicle_description: cd, manufacturer_name: cm, is_self_drive: true, driver: "mkn", is_insured: true, insurance_provider: cip, seats: csd, fuel_type: Fuel.Electric, maxSpeed: Int(mms) ?? 0, mileage: Int(mm) ?? 0))
                self.navigationController?.popViewController(animated: true)
                
            }
        }
    }
    
}
