//
//  ownerDetailsViewController.swift
//  Group9_W2020_MAD3115_FP
//
//  Created by adithyasai neeli on 2020-03-26.
//  Copyright © 2020 adithyasai neeli. All rights reserved.
//

import UIKit

class ownerDetailsViewController: UIViewController {

    @IBOutlet weak var lblOwnerDetaisl: UILabel!
     var ownerDetails : Owner?
      override func viewDidLoad() {
          super.viewDidLoad()

          
      }
     
                  
     
     
      
      override func viewWillAppear(_ animated: Bool) {
          super.viewWillAppear(animated)
        if let id = ownerDetails?.Id, let fn = ownerDetails?.fullName, let gn = ownerDetails?.gender, let ag = ownerDetails?.age,let em = ownerDetails?.emailId, let mn = ownerDetails?.mobileNumber, let un = ownerDetails?.userName, let pw = ownerDetails?.password , let ct = ownerDetails?.companyTitle, let bno = ownerDetails?.businessLandLineNumber, let ws = ownerDetails?.website{
                 
                    lblOwnerDetaisl.text =  "Owner Id: \(id)\n Driver FullName: \(fn)\n Owner Gender: \(gn)\n Owner Age: \(ag)\n Owner EmailId:  \(em)\n Owner Mobilenumber: \(mn)\n Owner UserName: \(un)\n Owner Password: \(pw)\n Owner Company Title: \(ct)\n Owner BusinessLandLine No : \(bno)\n Owner Website: \(ws)"
                    lblOwnerDetaisl.numberOfLines = 0
                    lblOwnerDetaisl.font = UIFont.boldSystemFont(ofSize: 14)
                    lblOwnerDetaisl.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
                    lblOwnerDetaisl.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
                
                
                }
          

      }
    

    

}
