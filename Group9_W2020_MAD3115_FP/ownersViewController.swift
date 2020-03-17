//
//  ownersViewController.swift
//  Group9_W2020_MAD3115_FP
//
//  Created by adithyasai neeli on 2020-03-16.
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
            let owner = ownerNames[indexPath.row]
            cell?.textLabel?.text = owner.fullName
            
            return cell!
            
        }
        

}
