//
//  AddNewCarViewController.swift
//  Group9_W2020_MAD3115_FP
//
//  Created by Mohit Kumar on 2020-03-27.
//  Copyright © 2020 adithyasai neeli. All rights reserved.
//

import UIKit

class AddNewCarViewController: UIViewController {

   
    
    @IBOutlet weak var carVin: UITextField!
    
    @IBOutlet weak var carDescription: UITextField!
    
    @IBOutlet weak var carManufacturer: UITextField!
    
    @IBOutlet weak var carSeats: UITextField!
    
    @IBOutlet weak var carColor: UITextField!
    
    @IBOutlet weak var carType: UITextField!
    
    @IBOutlet weak var carInsured: UITextField!
    
    @IBOutlet weak var carFuel: UITextField!
    
    @IBOutlet weak var carSelfDrive: UITextField!
    
    @IBOutlet weak var carInsuranceProvider: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        
    }
    
    @IBAction func saveCar(_ sender: UIButton) {
        
        if let cv = carVin.text, let cd = carDescription.text, let cm = carManufacturer.text, let cs = carSeats.text, let cc = carColor.text, let ct = carType.text, let ci = carInsured.text, let cf = carFuel.text, let csd = carSelfDrive.text, let cip = carInsuranceProvider.text{
            if cv == "" || cd == "" || cm == "" || cs == "" || cc == "" || ct == "" || ci == "" || cf == "" || csd == "" || cip == ""{
                let alertController = UIAlertController(title: "ERROR", message:
                    "Incomplete Form", preferredStyle: .alert)
                alertController.addAction(UIAlertAction(title: "Dismiss", style: .default))
                
                self.present(alertController, animated: true, completion: nil)
            }
            else{
                DataRepo.getInstance().addcar(car: Car(vin: cv, vehicle_description: cd, manufacturer_name: cm, is_self_drive: true, driver: "mko", is_insured: true, insurance_provider: cip, seats: cs, fuel_type: Fuel.Diesel, carType: ct, carColor: cc))
                self.navigationController?.popViewController(animated: true)
                
            }
        }
        
    }
    
}
