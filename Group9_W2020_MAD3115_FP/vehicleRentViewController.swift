//
//  vehicleRentViewController.swift
//  Group9_W2020_MAD3115_FP
//
//  Created by adithyasai neeli on 2020-03-24.
//  Copyright © 2020 adithyasai neeli. All rights reserved.
//

import UIKit

class vehicleRentViewController: UIViewController {

    @IBOutlet weak var tblVehicleRent: UITableView!
    
    @IBOutlet weak var lblVehicleRent: UILabel!
    lazy var rentedVehicles : [VehicleRent] = []
      var customerRents : Customer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
      

        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        if let id = customerRents?.Id, let fn = customerRents?.fullName, let gn = customerRents?.gender, let ag = customerRents?.age, let mn = customerRents?.mobileNumber,
            let em = customerRents?.emailId,
        let ad = customerRents?.address,
            let ct = customerRents?.city
    {
         
            lblVehicleRent.text = "  Customer ID          :    \(id)\n\n  Customer Name  :    \(fn)\n\n  Customer Gender   :    \(gn)\n\n  Customer Age  :    \(ag)\n\n  Customer MobileNumber  :    \(mn)\n\n  Customer EmailID  :    \(em)\n\n  Customer Address  :    \(ad)\n\n  Customer City  :    \(ct)"
            lblVehicleRent.numberOfLines = 0
            lblVehicleRent.font = UIFont.boldSystemFont(ofSize: 12)
            lblVehicleRent.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            lblVehicleRent.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        
        
        }

    }


}
