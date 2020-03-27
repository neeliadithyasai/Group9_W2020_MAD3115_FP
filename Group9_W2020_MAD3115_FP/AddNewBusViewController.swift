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
        
        
    }
}
