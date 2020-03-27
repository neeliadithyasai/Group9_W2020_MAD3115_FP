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
            lblContactus.text = "About Us:\n Adithya Sai Neeli- C0771910 \n Mohit Kumar- C0777190\n Manish pawar- C0771915"
            lblContactus.numberOfLines = 0
        }else{
            if Transition == "contactUsViewController"
            {
                lblContactus.text = "Contact Us:\n 437 989 8043"
                lblContactus.numberOfLines = 0
            }
        }
    }

}
