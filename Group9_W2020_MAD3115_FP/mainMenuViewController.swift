//
//  mainMenuViewController.swift
//  Group9_W2020_MAD3115_FP
//
//  Created by adithyasai neeli on 2020-03-16.
//  Copyright © 2020 adithyasai neeli. All rights reserved.
//

import UIKit

class mainMenuViewController: UIViewController {
    
    @IBOutlet weak var btnDisplayAllCustomers: UIButton!
    
    @IBOutlet weak var sideView: UIView!
    
    @IBOutlet weak var sideTblView: UITableView!
    
    var isSideViewOpen : Bool = false
    
    @IBOutlet weak var btnCalculateFare: UIButton!
    
    var arrData = ["Display All Customers","Add New Customer", "Add new Vehicle", "Add new Driver"]
    var arrImg = [#imageLiteral(resourceName: "carlogo"),#imageLiteral(resourceName: "carlogo"),#imageLiteral(resourceName: "carlogo"),#imageLiteral(resourceName: "carlogo")]
    
    
    @IBOutlet weak var btnDisplayAllRentedVehicles: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        sideView.isHidden = true
        sideTblView.backgroundColor = UIColor.groupTableViewBackground
        isSideViewOpen = false
    }
    

    @IBAction func barMenuBtn(_ sender: UIBarButtonItem) {
        sideTblView.isHidden = false
        sideView.isHidden = false
        self.view.bringSubviewToFront(sideView)
        if !isSideViewOpen {
            isSideViewOpen = true
            sideView.frame = CGRect(x: 0, y: 96, width: 3, height: 414)
            sideTblView.frame = CGRect(x: 0, y: 0, width: 0, height: 414)
            UIView.setAnimationDuration(0.3)
            UIView.setAnimationDelegate(self)
            UIView.beginAnimations("TableAnimation", context: nil)
            sideView.frame = CGRect(x: 0, y: 96, width: 240, height: 414)
            sideTblView.frame = CGRect(x: 0, y: 0, width: 240, height: 414)
            UIView.commitAnimations()
        }
        else {
            sideTblView.isHidden = true
            sideView.isHidden = true
            isSideViewOpen = false
            sideView.frame = CGRect(x: 0, y: 96, width: 240, height: 414)
            sideTblView.frame = CGRect(x: 0, y: 0, width: 240, height: 414)
            UIView.setAnimationDuration(0.3)
            UIView.setAnimationDelegate(self)
            UIView.beginAnimations("TableAnimation", context: nil)
            sideView.frame = CGRect(x: 0, y: 96, width: 3, height: 414)
            sideTblView.frame = CGRect(x: 0, y: 0, width: 0, height: 414)
            UIView.commitAnimations()
        }
        
    }

       
    }
extension mainMenuViewController : UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell : SideMenuTableViewCell = tableView.dequeueReusableCell(withIdentifier: "sideCell") as! SideMenuTableViewCell
        cell.img.image = arrImg[indexPath.row]
        cell.lbl.text = arrData[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 1{
            let sb = UIStoryboard(name: "Main", bundle: nil)
             
             if let viewController = sb.instantiateViewController(identifier: "addNewCustomerViewController") as? addNewCustomerViewController {
                 navigationController?.pushViewController(viewController, animated: true)
            
            }
        }
        else if indexPath.row == 0{
            let sb = UIStoryboard(name: "Main", bundle: nil)
                 
                 if let viewController = sb.instantiateViewController(identifier: "customerViewController") as? customerViewController {
                     navigationController?.pushViewController(viewController, animated: true)
            }
        }
    }
    
    
}
    
    
   
