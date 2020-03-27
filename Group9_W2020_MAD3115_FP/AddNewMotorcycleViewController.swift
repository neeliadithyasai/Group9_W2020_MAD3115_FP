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
    
    
    }
    
}
