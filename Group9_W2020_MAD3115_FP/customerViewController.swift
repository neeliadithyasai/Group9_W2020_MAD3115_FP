//
//  customerViewController.swift
//  Group9_W2020_MAD3115_FP
//
//  Created by adithyasai neeli on 2020-03-16.
//  Copyright © 2020 adithyasai neeli. All rights reserved.
//

import UIKit

class customerViewController: UIViewController {
    @IBOutlet weak var tblCustomers: UITableView!
    
    lazy var customerNames : [Customer] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Customer"

        
    }
   
    override func viewWillAppear(_ animated: Bool) {
           customerNames = DataRepo.getInstance().getAllCustomers()
           tblCustomers.reloadData()
    
    }
   
}

extension customerViewController: UITableViewDelegate,UITableViewDataSource{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section:  Int) -> Int {
        return customerNames.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "customerCell")
        let customer = customerNames[indexPath.row]
        cell?.textLabel?.text = customer.fullName
        
        return cell!
        
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
       // let selectedTrail = customerNames[indexPath.row]
        
        let sb = UIStoryboard(name: "Main", bundle: nil)
        
        if let viewController = sb.instantiateViewController(identifier: "vehicleRentViewController") as? vehicleRentViewController {
    navigationController?.pushViewController(viewController, animated: true)
//            viewController.customerBill = selectedTrail
      }
        
   }
    
}

