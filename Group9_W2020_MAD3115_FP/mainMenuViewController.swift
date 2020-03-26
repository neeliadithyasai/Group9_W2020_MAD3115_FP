//
//  mainMenuViewController.swift
//  Group9_W2020_MAD3115_FP
//
//  Created by adithyasai neeli on 2020-03-16.
//  Copyright © 2020 adithyasai neeli. All rights reserved.
//

import UIKit

class mainMenuViewController: UIViewController {
    
    
    
    @IBOutlet weak var sideView: UIView!
    
    @IBOutlet weak var sideTblView: UITableView!
    
    var isSideViewOpen : Bool = false
    
    
    
    var arrData = ["Display All Customers","Add New Customer", "Add new Driver", "Add new Owner","Contact Us","About Us", "Logout"]
    var arrImg = [#imageLiteral(resourceName: "carlogo"),#imageLiteral(resourceName: "carlogo"),#imageLiteral(resourceName: "carlogo"),#imageLiteral(resourceName: "carlogo"),#imageLiteral(resourceName: "carlogo"),#imageLiteral(resourceName: "carlogo"),#imageLiteral(resourceName: "carlogo")]
    
    
    
    
    
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
    
    
    @IBAction func btnDisplayAllOwners(_ sender: Any) {
        
        
        let sb = UIStoryboard(name: "Main", bundle: nil)
        
        if let viewController = sb.instantiateViewController(identifier: "ownersViewController") as? ownersViewController {
            navigationController?.pushViewController(viewController, animated: true)
            
        }
        
    }
    
    @IBAction func btnDisplayAllCustomers(_ sender: Any) {
        let sb = UIStoryboard(name: "Main", bundle: nil)
        
        if let viewController = sb.instantiateViewController(identifier: "customerViewController") as? customerViewController {
            navigationController?.pushViewController(viewController, animated: true)
        }
        
        
    }
    
    
    @IBAction func btnDisplayAllDrivers(_ sender: Any) {
        let sb = UIStoryboard(name: "Main", bundle: nil)
        if let viewController = sb.instantiateViewController(identifier: "driversViewController") as? driversViewController {
            navigationController?.pushViewController(viewController, animated: true)
            
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
        if indexPath.row == 2{
            let sb = UIStoryboard(name: "Main", bundle: nil)
            
            if let viewController = sb.instantiateViewController(identifier: "addDriver") as? AddDriverViewController {
                navigationController?.pushViewController(viewController, animated: true)
                
            }
        }
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
        else if indexPath.row == 3{
            let sb = UIStoryboard(name: "Main", bundle: nil)
            
            if let viewController = sb.instantiateViewController(identifier: "addOwnerVC") as? AddOwnerViewController {
                navigationController?.pushViewController(viewController, animated: true)
            }
        }
        else if indexPath.row == 6{
            let alert = UIAlertController(title: "Logged Out", message: "Session Over", preferredStyle: .alert)
            let OKAction = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: {
                (_)in
                self.navigationController?.popViewController(animated: true)
            })
            
            alert.addAction(OKAction)
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    
}



