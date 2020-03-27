//
//  AddNewBusViewController.swift
//  Group9_W2020_MAD3115_FP
//
//  Created by Mohit Kumar on 2020-03-27.
//  Copyright © 2020 adithyasai neeli. All rights reserved.
//

import UIKit

class AddNewBusViewController: UIViewController {

    @IBOutlet weak var busVin: UITextField!
    
    @IBOutlet weak var busDescription: UITextField!
    
    @IBOutlet weak var busManufacturer: UITextField!
    
    @IBOutlet weak var busSeats: UITextField!
    
    @IBOutlet weak var busFuel: UITextField!
    
    @IBOutlet weak var busSelfDrive: UITextField!
    
    @IBOutlet weak var busInsured: UITextField!
    
    @IBOutlet weak var busAccessibility: UITextField!
    
    @IBOutlet weak var busWifi: UITextField!
    
    @IBOutlet weak var busType: UITextField!
    
    @IBOutlet weak var busInsuranceProvider: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func saveBus(_ sender: UIButton) {
        if let cv = busVin.text, let cd = busDescription.text, let cm = busManufacturer.text, let cs = busSeats.text, let ba = busAccessibility.text, let ct = busType.text, let ci = busInsured.text, let cf = busFuel.text, let csd = busSelfDrive.text, let cip = busInsuranceProvider.text, let bw = busWifi.text{
            if cv == "" || cd == "" || cm == "" || cs == "" || ba == "" || ct == "" || ci == "" || cf == "" || csd == "" || cip == "" || bw == ""{
                let alertController = UIAlertController(title: "ERROR", message:
                    "Incomplete Form", preferredStyle: .alert)
                alertController.addAction(UIAlertAction(title: "Dismiss", style: .default))
                
                self.present(alertController, animated: true, completion: nil)
            }
            else{
                DataRepo.getInstance().addbus(bus: Bus(vin: cv, vehicle_description: cd, manufacturer_name: cm, is_self_drive: true, driver: "mn", is_insured: true, insurance_provider: cip, seats: cs, fuel_type: Fuel.Diesel, busType: ct, accessibility_service_available: true, wifi_available: true))
                self.navigationController?.popViewController(animated: true)
                
            }
        }
        
    }
}
