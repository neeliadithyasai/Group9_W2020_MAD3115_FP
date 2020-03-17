//
//  carsViewController.swift
//  Group9_W2020_MAD3115_FP
//
//  Created by adithyasai neeli on 2020-03-17.
//  Copyright © 2020 adithyasai neeli. All rights reserved.
//

import UIKit

class VehiclesViewController: UIViewController {
    
    @IBOutlet weak var tblCars: UITableView!
    
    lazy var carsNames : [Vehicle] = []
    lazy var busesNames : [Vehicle] = []
    lazy var motorcylesNames : [Vehicle] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Vehicles"
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        carsNames = DataRepo.getInstance().getAllCars()
        busesNames = DataRepo.getInstance().getAllbuses()
        motorcylesNames = DataRepo.getInstance().getAllmotorcycles()
        tblCars.reloadData()
        
    }
    
}

extension VehiclesViewController: UITableViewDelegate,UITableViewDataSource{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if(section == 0)
        {
            return "CARS";
        }
        if(section == 1)
        {
            return "BUSES";
        }
        else{
            return "MotorCycles";
        }
       
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section:  Int) -> Int {
        if(section == 0)
        {
            return carsNames.count;
        }
        if(section == 1)
        {
            return busesNames.count;
        }
        else{
            return motorcylesNames.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "carCell")
        if(indexPath.section == 0)
        {
            let car = carsNames[indexPath.row]
            cell?.textLabel?.text = car.manufacturer_name
        }
        if(indexPath.section == 1)
        {
            let bus = busesNames[indexPath.row]
            cell?.textLabel?.text = bus.manufacturer_name

        }
       if(indexPath.section == 2)
        {
            let motorcyles = motorcylesNames[indexPath.row]
            cell?.textLabel?.text = motorcyles.manufacturer_name
        }
        return cell!
    }
    
    
}





