//
//  contactUsViewController.swift
//  Group9_W2020_MAD3115_FP
//
//  Created by adithyasai neeli on 2020-03-26.
//  Copyright © 2020 adithyasai neeli. All rights reserved.
//

import UIKit

class contactUsViewController: UIViewController {
  var Transition : String?
    
    @IBOutlet weak var lblContactus: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        display()
    }
    
    func display(){
        if Transition == "aboutUsViewController"{
            lblContactus.text = "About Us:\n This is vehicle renting app project created by:\n Adithya Sai Neeli- C0771910 \n Mohit Kumar- C0777190\n Manish pawar- C0771915\n This app contains detailed information of all customers, drivers and owners.\n It also contains the information of all the vehicles and the details of persons who own it.\n User can Add new vehicles , customers, drivers, owners information.\n "
            lblContactus.numberOfLines = 0
        }else{
            if Transition == "contactUsViewController"
            {
                lblContactus.text = "Contact Us:\n\n  C0771915@mylambton.ca\n  C0777190@mylambton.ca\n  C0771910@mylambton.ca"
                lblContactus.numberOfLines = 0
            }
        }
    }

}
