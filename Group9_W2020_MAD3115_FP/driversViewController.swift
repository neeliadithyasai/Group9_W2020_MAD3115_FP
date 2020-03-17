//
//  driversViewController.swift
//  Group9_W2020_MAD3115_FP
//
//  Created by adithyasai neeli on 2020-03-17.
//  Copyright © 2020 adithyasai neeli. All rights reserved.
//

import UIKit

class driversViewController: UIViewController {

    @IBOutlet weak var tblDrivers: UITableView!
    
          lazy var driverNames : [Driver] = []
            override func viewDidLoad() {
                super.viewDidLoad()
                self.navigationItem.title = "Drivers"

                
            }
           
            override func viewWillAppear(_ animated: Bool) {
                driverNames = DataRepo.getInstance().getAlldrivers()
                   tblDrivers.reloadData()
            
            }
           
        }

        extension driversViewController: UITableViewDelegate,UITableViewDataSource{
            
            func numberOfSections(in tableView: UITableView) -> Int {
                return 1
            }
            
            func tableView(_ tableView: UITableView, numberOfRowsInSection section:  Int) -> Int {
                return driverNames.count
            }
            
            func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
                let cell = tableView.dequeueReusableCell(withIdentifier: "driverCell")
                let driver = driverNames[indexPath.row]
                cell?.textLabel?.text = driver.fullName
                
                return cell!
                
            }
            

    }
