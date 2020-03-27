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
        
    }
    
}
