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
    
    
    
    var arrData = ["Display All Vehicles","Add New Customer", "Add new Driver", "Add new Owner","Contact Us","About Us", "Logout"]
    var arrImg = [#imageLiteral(resourceName: "icons8-car-50"),#imageLiteral(resourceName: "icons8-customer-50"),#imageLiteral(resourceName: "icons8-driving-50"),#imageLiteral(resourceName: "icons8-landlord-50"),#imageLiteral(resourceName: "icons8-email-50"),#imageLiteral(resourceName: "icons8-about-50"),#imageLiteral(resourceName: "icons8-logout-rounded-up-50")]
    
    lazy var customers : [Person] = []
    lazy var drivers : [Person] = []
    lazy var owners : [Person] = []
    
    let segmentedControl : UISegmentedControl = {
           let sc = UISegmentedControl(items: ["Customers","Drivers","Owners"])
           sc.selectedSegmentIndex = 0
           sc.addTarget(self, action: #selector(handleSegmentChange), for: .valueChanged)
           return sc
       }()
    
    let tableView = UITableView(frame: .zero, style: .plain)
    
    
    lazy var rowsToDisplay = customers
    
    @objc func handleSegmentChange(){
        switch segmentedControl.selectedSegmentIndex{
        case 0 :
            rowsToDisplay = customers
        case 1 :
            rowsToDisplay = drivers
        default :
            rowsToDisplay = owners
        }
        tableView.reloadData()
    } 
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "DefaultCell")
        sideView.isHidden = true
       // sideTblView.backgroundColor = UIColor.groupTableViewBackground
        isSideViewOpen = false
        tableView.dataSource = self
        tableView.delegate = self
        sideTblView.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        
        view.backgroundColor = .white
        navigationItem.title = "Persons"
        let paddedStackView = UIStackView(arrangedSubviews: [segmentedControl])
        paddedStackView.layoutMargins = .init(top: 12, left: 12, bottom: 12, right: 12)
        paddedStackView.isLayoutMarginsRelativeArrangement = true
        
        let stackView = UIStackView(arrangedSubviews: [paddedStackView,tableView])
        stackView.axis = .vertical
        
        view.addSubview(stackView)
        stackView.anchor(top: view.safeAreaLayoutGuide.topAnchor, leading: view.leadingAnchor, bottom: view.bottomAnchor, trailing: view.trailingAnchor, padding: .zero)
        segmentedControl.backgroundColor = #colorLiteral(red: 0.1411764771, green: 0.3960784376, blue: 0.5647059083, alpha: 1)
        segmentedControl.layer.borderColor = #colorLiteral(red: 0.9995340705, green: 0.988355577, blue: 0.4726552367, alpha: 1)
        segmentedControl.selectedSegmentTintColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        sideView.isHidden = true

        self.customers = DataRepo.getInstance().getAllCustomers()
        self.drivers = DataRepo.getInstance().getAlldrivers()
        self.owners = DataRepo.getInstance().getAllOwners()
        self.tableView.reloadData()
    }
    override func viewDidDisappear(_ animated: Bool) {
        tableView.reloadData()
    }
 
    @IBAction func barMenuBtn(_ sender: UIBarButtonItem) {
        sideTblView.isHidden = false
        sideView.isHidden = false
        self.view.bringSubviewToFront(sideView)
        if !isSideViewOpen {
            isSideViewOpen = true
            sideView.frame = CGRect(x: 0, y: 96, width: 3, height: 717)
            sideTblView.frame = CGRect(x: 0, y: 0, width: 0, height: 717)
            UIView.setAnimationDuration(0.5)
            UIView.setAnimationDelegate(self)
            UIView.beginAnimations("TableAnimation", context: nil)
            
            sideView.frame = CGRect(x: 0, y: 96, width: 240, height: 717)
            sideTblView.frame = CGRect(x: 0, y: 0, width: 240, height: 717)
            UIView.commitAnimations()
        }
            
        else {
            sideTblView.isHidden = true
            sideView.isHidden = true
            isSideViewOpen = false
            sideView.frame = CGRect(x: 0, y: 96, width: 240, height: 717)
            sideTblView.frame = CGRect(x: 0, y: 0, width: 240, height: 717)
            UIView.setAnimationDuration(0.3)
            UIView.setAnimationDelegate(self)
            UIView.beginAnimations("TableAnimation", context: nil)
            sideView.frame = CGRect(x: 0, y: 96, width: 3, height: 717)
            sideTblView.frame = CGRect(x: 0, y: 0, width: 0, height: 717)
            UIView.commitAnimations()
        }
    }
    
    @IBAction func btnDisplayAllVehicles(_ sender: UIButton) {
        let sb = UIStoryboard(name: "Main", bundle: nil)
        if let viewController = sb.instantiateViewController(identifier: "allVehiclesVC") as? AllVehiclesViewController {
            navigationController?.pushViewController(viewController, animated: true)
        }
    }
    
    
    
    
}
extension mainMenuViewController : UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableView == sideTblView{
        return arrData.count
        }
        else {
            if segmentedControl.selectedSegmentIndex == 0{
                return customers.count
            }
            else if segmentedControl.selectedSegmentIndex == 1{
            return drivers.count
            }
            else{
                return owners.count
            }
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        if tableView == sideTblView{
        let cell : SideMenuTableViewCell = tableView.dequeueReusableCell(withIdentifier: "sideCell") as! SideMenuTableViewCell
        cell.img.image = arrImg[indexPath.row]
        cell.lbl.text = arrData[indexPath.row]
        cell.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        cell.textLabel?.textColor = UIColor.white
        return cell
        }
            
        else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "DefaultCell", for: indexPath)
            if segmentedControl.selectedSegmentIndex == 0{
                let c = customers[indexPath.row]
                cell.textLabel?.text = "\(c.firstName) \(c.lastName)"
                return cell
            }
            else if segmentedControl.selectedSegmentIndex == 1{
            let c = drivers[indexPath.row]
            cell.textLabel?.text = "\(c.firstName) \(c.lastName)"
            
            return cell
        }
            else{
                let c = owners[indexPath.row]
                cell.textLabel?.text = "\(c.firstName) \(c.lastName)"
                
                return cell

            }
    }
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if tableView == sideTblView{
        
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

            if let viewController = sb.instantiateViewController(identifier: "allVehiclesVC") as? AllVehiclesViewController {
                navigationController?.pushViewController(viewController, animated: true)
            }
        }
        else if indexPath.row == 3{
            let sb = UIStoryboard(name: "Main", bundle: nil)

            if let viewController = sb.instantiateViewController(identifier: "addOwnerVC") as? AddOwnerViewController {
                navigationController?.pushViewController(viewController, animated: true)
            }
        }
        else if indexPath.row == 4{
                let sb = UIStoryboard(name: "Main", bundle: nil)

                if let viewController = sb.instantiateViewController(identifier: "contactUsViewController") as? contactUsViewController {
                    viewController.Transition = "contactUsViewController"
                    navigationController?.pushViewController(viewController, animated: true)
                }
            }else if indexPath.row == 5{
                let sb = UIStoryboard(name: "Main", bundle: nil)

                if let viewController = sb.instantiateViewController(identifier: "contactUsViewController") as? contactUsViewController {
                     viewController.Transition = "aboutUsViewController"
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
    else {
            if segmentedControl.selectedSegmentIndex == 0 {
        let selectedTrail = customers[indexPath.row]
                
            let sb = UIStoryboard(name: "Main", bundle: nil)
            
            if let viewController = sb.instantiateViewController(identifier: "sharedVC") as? SharedViewController {
        navigationController?.pushViewController(viewController, animated: true)
                viewController.customer = selectedTrail as? Customer
                viewController.index = indexPath.row
          }
        }
            else if segmentedControl.selectedSegmentIndex == 1{
                let selectedTrail = drivers[indexPath.row]
                    
                    let sb = UIStoryboard(name: "Main", bundle: nil)
                    
                    if let viewController = sb.instantiateViewController(identifier: "sharedVC") as? SharedViewController {
                navigationController?.pushViewController(viewController, animated: true)
                        viewController.driver = selectedTrail as? Driver
                        viewController.index = indexPath.row
                  }

            }
            else{
                let selectedTrail = owners[indexPath.row]
                    
                    let sb = UIStoryboard(name: "Main", bundle: nil)
                    
                    if let viewController = sb.instantiateViewController(identifier: "sharedVC") as? SharedViewController {
                navigationController?.pushViewController(viewController, animated: true)
                        viewController.owner = selectedTrail as? Owner
                        viewController.index = indexPath.row
                  }
            }
            
    }
    }
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
            cell.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        
    }
    
}



