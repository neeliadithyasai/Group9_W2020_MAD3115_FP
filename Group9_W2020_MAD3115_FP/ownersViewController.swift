//
//  ownersViewController.swift
//  Group9_W2020_MAD3115_FP
//
//  Created by adithyasai neeli on 2020-03-26.
//  Copyright © 2020 adithyasai neeli. All rights reserved.
//

import UIKit

class ownersViewController: UIViewController {

    @IBOutlet weak var tblOwners: UITableView!
    
         lazy var ownerNames : [Owner] = []
           override func viewDidLoad() {
               super.viewDidLoad()
               self.navigationItem.title = "Owners"

               
           }
          
           override func viewWillAppear(_ animated: Bool) {
               ownerNames = DataRepo.getInstance().getAllOwners()
                  tblOwners.reloadData()
           
           }
          
       }

       extension ownersViewController: UITableViewDelegate,UITableViewDataSource{
           
           func numberOfSections(in tableView: UITableView) -> Int {
               return 1
           }
           
           func tableView(_ tableView: UITableView, numberOfRowsInSection section:  Int) -> Int {
               return ownerNames.count
           }
           
           func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
               let cell = tableView.dequeueReusableCell(withIdentifier: "ownerCell")
              // let owner = ownerNames[indexPath.row]
           
            for i in ownerNames
            {
                cell?.textLabel?.text = "Full name : \(i.fullName)\n Gender : \(i.gender)\n Age: \(i.age)\n Mobile number : \(i.mobileNumber)\n Email Id : \(i.emailId)\n Username : \(i.userName)\n Password : \(i.password)\n Company title : \(i.companyTitle)\n Business Landline number : \(i.businessLandLineNumber)\n Website : \(i.website) "
                cell?.textLabel?.numberOfLines = 0
                
            }
              
               
               return cell!
               
           }
           

   }
