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
    var index : Int?
    
    @IBOutlet weak var lblPerson: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Bill Details"
        let navBar = self.navigationController?.navigationBar
        navBar?.barTintColor = UIColor.gray
        navBar?.isTranslucent = true
        navigationItem.leftBarButtonItem?.tintColor = UIColor.white
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Delete", style: .plain, target: self, action: #selector(addTapped))

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
        
        else if let id = driver?.Id, let fn = driver?.fullName, let gn = driver?.gender, let ag = driver?.age, let hc = driver?.driverHistoryClear, let ln = driver?.driverLicenceNumber,
            let em = driver?.emailId, let mn = driver?.mobileNumber,  let sl = driver?.salary, let _ = driver?.userName, let _ = driver?.password {
           
              lblPerson.text =  "Driver Id: \(id)\n\n Driver FullName: \(fn)\n\n Driver Gender: \(gn)\n\n Driver Age: \(ag)\n\n Driver History Clear: \(hc)\n\n   Driver License no:  \(ln)\n\n Driver EmailId:  \(em)\n\n Driver Mobilenumber: \(mn)\n\n  Driver Salary:  \(sl)"
              lblPerson.numberOfLines = 0
              lblPerson.font = UIFont.boldSystemFont(ofSize: 12)
              lblPerson.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
              lblPerson.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
          
          
          }
        else {
             if let id = owner?.Id, let fn = owner?.fullName, let gn = owner?.gender, let ag = owner?.age,let em = owner?.emailId, let mn = owner?.mobileNumber, let un = owner?.userName, let pw = owner?.password , let ct = owner?.companyTitle, let bno = owner?.businessLandLineNumber, let ws = owner?.website{
             
                lblPerson.text =  "Owner Id: \(id)\n\n Driver FullName: \(fn)\n\n Owner Gender: \(gn)\n\n Owner Age: \(ag)\n\n Owner EmailId:  \(em)\n\n Owner Mobilenumber: \(mn)\n\n Owner UserName: \(un)\n\n Owner Password: \(pw)\n\n Owner Company Title: \(ct)\n\n Owner BusinessLandLine No : \(bno)\n\n Owner Website: \(ws)"
                lblPerson.numberOfLines = 0
                lblPerson.font = UIFont.boldSystemFont(ofSize: 12)
                lblPerson.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
                lblPerson.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
            
            
            }
        }


    }
    @objc func addTapped(){
        
        if driver?.Id != nil{
            DataRepo.getInstance().removeDriver(index: index!)
            self.navigationController?.popViewController(animated: true)
        }
        
        else if owner?.Id 
        
    }
}

extension SharedViewController: UITableViewDataSource, UITableViewDelegate{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView?
    {
        let headerView = UIView(frame: CGRect(x: 0, y: 0, width: tableView.bounds.size.width, height: 30))
        if (section == 0) {
            headerView.backgroundColor = UIColor.systemRed
        } else {
            headerView.backgroundColor = UIColor.clear
        }
        return headerView
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if (customer?.Id) != nil {
        return (customer?.vehicleRent.count)!
     }
        else if (driver?.Id) != nil {
            return 0
        }
//        else  (owner?.Id) != nil{
        else{
            return (owner?.vehicleList.count)!
        }
//        else {
//            return (driver?.)
//        }
}
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "sharedCell", for: indexPath)
        cell.textLabel?.text = "abc"
        if (customer?.Id) != nil{
            
                //let v = rentedVehicles[indexPath.row]
                
               
                    for i in customer!.vehicleRent
                    {
                        for a in i.value.vRented{
                            
                        
                            cell.textLabel?.text = "Vehicle name        : \(i.value.vehicle)\n rent start  Date    : \(i.value.rent_start)\n rent end Date       : \(i.value.rent_end)\n distance in Km     : \(i.value.distance_km)\n total days               : \(i.value.totalDays())\n total Bill               :  \(i.value.totalBill())\n*******Car Details******\nVehicle Insurance Number : \(a.value.vin)\nDescription : \(a.value.vehicle_description)\nManufacturer : \(a.value.manufacturer_name)\nDriver : \(a.value.driver)\nInsurance Provider : \(a.value.insurance_provider)\nNumber of seats : \(a.value.seats)\nCar Seats : \(a.value.seats)\nFuel Type : \(a.value.fuel_type)\nBase Rate : \(a.value.base_rate)\nRate per Km : \(a.value.rate_per_km)"
                              cell.textLabel?.numberOfLines = 0
                }
            }
            
                return cell
        }
        else {
            return cell
        }
    }
    
}
