//
//  mainMenuViewController.swift
//  Group9_W2020_MAD3115_FP
//
//  Created by adithyasai neeli on 2020-03-16.
//  Copyright © 2020 adithyasai neeli. All rights reserved.
//

import UIKit

class mainMenuViewController: UIViewController {
    
    @IBOutlet weak var btnDisplayAllCustomers: UIButton!
    
    
    
    @IBOutlet weak var btnCalculateFare: UIButton!
    
    
    @IBOutlet weak var btnDisplayAllRentedVehicles: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        

        // Do any additional setup after loading the view.
    }
    


    @IBAction func btnDisplayAllCustomers(_ sender: Any) {
        
        let sb = UIStoryboard(name: "Main", bundle: nil)
         
         if let viewController = sb.instantiateViewController(identifier: "customerViewController") as? customerViewController {
             navigationController?.pushViewController(viewController, animated: true)
        
    }
    }
    

    @IBAction func btnAddNewCustomer(_ sender: UIButton) {
        let sb = UIStoryboard(name: "Main", bundle: nil)
         
         if let viewController = sb.instantiateViewController(identifier: "addNewCustomerViewController") as? addNewCustomerViewController {
             navigationController?.pushViewController(viewController, animated: true)
        
        }
    }
    
    
       
    }
    
    
   
