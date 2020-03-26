//
//  SharedViewController.swift
//  Group9_W2020_MAD3115_FP
//
//  Created by Mohit Kumar on 2020-03-26.
//  Copyright © 2020 adithyasai neeli. All rights reserved.
//

import UIKit

class SharedViewController: UIViewController {

    var customer : Customer?
    var owner : Owner?
    var driver : Driver?
    
    @IBOutlet weak var lblPerson: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()


    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        if let id = customer?.Id, let fn = customer?.fullName, let gn = customer?.gender, let ag = customer?.age, let mn = customer?.mobileNumber,
            let em = customer?.emailId,
        let ad = customer?.address,
            let ct = customer?.city
    {
         
            lblPerson.text = "  Customer ID          :    \(id)\n\n  Customer Name  :    \(fn)\n\n  Customer Gender   :    \(gn)\n\n  Customer Age  :    \(ag)\n\n  Customer MobileNumber  :    \(mn)\n\n  Customer EmailID  :    \(em)\n\n  Customer Address  :    \(ad)\n\n  Customer City  :    \(ct)"
            lblPerson.numberOfLines = 0
            lblPerson.font = UIFont.boldSystemFont(ofSize: 12)
            lblPerson.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            lblPerson.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        }

    }

}
