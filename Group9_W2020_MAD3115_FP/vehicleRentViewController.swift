//
//  vehicleRentViewController.swift
//  Group9_W2020_MAD3115_FP
//
//  Created by adithyasai neeli on 2020-03-24.
//  Copyright © 2020 adithyasai neeli. All rights reserved.
//

import UIKit

class vehicleRentViewController: UIViewController {

    @IBOutlet weak var tblVehicleRent: UITableView!
    
    @IBOutlet weak var lblVehicleRent: UILabel!
    lazy var rentedVehicles : [Vehicle] = []
      var customerRents : Customer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
      

        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        if let id = customerRents?.Id, let fn = customerRents?.fullName, let gn = customerRents?.gender, let ag = customerRents?.age, let mn = customerRents?.mobileNumber,
            let em = customerRents?.emailId,
        let ad = customerRents?.address,
            let ct = customerRents?.city
    {
         
            lblVehicleRent.text = "  Customer ID          :    \(id)\n\n  Customer Name  :    \(fn)\n\n  Customer Gender   :    \(gn)\n\n  Customer Age  :    \(ag)\n\n  Customer MobileNumber  :    \(mn)\n\n  Customer EmailID  :    \(em)\n\n  Customer Address  :    \(ad)\n\n  Customer City  :    \(ct)"
            lblVehicleRent.numberOfLines = 0
            lblVehicleRent.font = UIFont.boldSystemFont(ofSize: 12)
            lblVehicleRent.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            lblVehicleRent.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        
        
        }

    }


}

extension vehicleRentViewController: UITableViewDelegate, UITableViewDataSource{
    
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
        return (customerRents?.vehicleRent.count)!
    }
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       let cell = tableView.dequeueReusableCell(withIdentifier: "rentedCell", for: indexPath)
        //let v = rentedVehicles[indexPath.row]

       
            for i in customerRents!.vehicleRent
        {


            cell.textLabel?.text = "Vehicle name        : \(i.value.vehicle)\n rent start  Date    : \(i.value.rent_start)\n rent end Date       : \(i.value.rent_end)\n distance in Km     : \(i.value.distance_km)\n total days               : \(i.value.totalDays())\n total Bill               :  \(i.value.totalBill())\n"
                      cell.textLabel?.numberOfLines = 0


        }
    
        return cell
        }
       
    
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if(indexPath.row % 2 == 0){
            cell.backgroundColor = #colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1)
            cell.textLabel?.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
            cell.textLabel?.font = UIFont.boldSystemFont(ofSize: 17)
            
        }
        else {
            cell.backgroundColor = #colorLiteral(red: 0.8196078431, green: 0.8431372549, blue: 0.8588235294, alpha: 1)
            cell.textLabel?.font = UIFont.boldSystemFont(ofSize: 17)
        }
    }
    
    
}
