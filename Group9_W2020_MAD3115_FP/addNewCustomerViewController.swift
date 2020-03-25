//
//  addNewCustomerViewController.swift
//  Group9_W2020_MAD3115_FP
//
//  Created by adithyasai neeli on 2020-03-25.
//  Copyright © 2020 adithyasai neeli. All rights reserved.
//

import UIKit

class addNewCustomerViewController: UIViewController {

    @IBOutlet weak var txtCustomerId: UITextField!
    
    @IBOutlet weak var txtCustomerName: UITextField!
    
    @IBOutlet weak var txtCustomerGender: UITextField!
    
    @IBOutlet weak var txtCustomerAge: UITextField!
    
    
    @IBOutlet weak var txtCustomerMobileNumber: UITextField!
    
    @IBOutlet weak var txtCustomerEmailId: UITextField!
    
    @IBOutlet weak var txtCustomerAddress: UITextField!
    
    
    @IBOutlet weak var txtCustomerCity: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
