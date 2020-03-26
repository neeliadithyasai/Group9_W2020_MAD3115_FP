//
//  driverDetailsViewController.swift
//  Group9_W2020_MAD3115_FP
//
//  Created by adithyasai neeli on 2020-03-26.
//  Copyright © 2020 adithyasai neeli. All rights reserved.
//

import UIKit

class driverDetailsViewController: UIViewController {

    @IBOutlet weak var lblDriver: UILabel!
    var driverDetails : Driver?
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
   
      
       
   
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if let id = driverDetails?.Id, let fn = driverDetails?.fullName, let gn = driverDetails?.gender, let ag = driverDetails?.age, let hc = driverDetails?.driverHistoryClear, let ln = driverDetails?.driverLicenceNumber,
            let em = driverDetails?.emailId, let mn = driverDetails?.mobileNumber,  let sl = driverDetails?.salary, let un = driverDetails?.userName, let pw = driverDetails?.password {
               
                  lblDriver.text =  "Driver Id: \(id)\n Driver FullName: \(fn)\n Driver Gender: \(gn)\n Driver Age: \(ag)\n Driver History Clear: \(hc)\n   Driver License no:  \(ln)\n Driver EmailId:  \(em)\n Driver Mobilenumber: \(mn)\n  Driver Salary:  \(sl)\n Driver UserName: \(un)\n Driver Password: \(pw)"
                  lblDriver.numberOfLines = 0
                  lblDriver.font = UIFont.boldSystemFont(ofSize: 14)
                  lblDriver.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
                  lblDriver.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
              
              
              }
        

    }

}
