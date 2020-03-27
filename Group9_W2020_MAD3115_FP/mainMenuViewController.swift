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
    var arrImg = [#imageLiteral(resourceName: "carlogo"),#imageLiteral(resourceName: "carlogo"),#imageLiteral(resourceName: "carlogo"),#imageLiteral(resourceName: "carlogo"),#imageLiteral(resourceName: "carlogo"),#imageLiteral(resourceName: "carlogo"),#imageLiteral(resourceName: "carlogo")]
    
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
        
        sideView.isHidden = true
       // sideTblView.backgroundColor = UIColor.groupTableViewBackground
        isSideViewOpen = false
        tableView.dataSource = self
        tableView.delegate = self
        
        view.backgroundColor = .white
        navigationItem.title = "All persons"
        let paddedStackView = UIStackView(arrangedSubviews: [segmentedControl])
        paddedStackView.layoutMargins = .init(top: 12, left: 12, bottom: 12, right: 12)
        paddedStackView.isLayoutMarginsRelativeArrangement = true
        
        let stackView = UIStackView(arrangedSubviews: [paddedStackView,tableView])
        stackView.axis = .vertical
        
        view.addSubview(stackView)
        stackView.anchor(top: view.safeAreaLayoutGuide.topAnchor, leading: view.leadingAnchor, bottom: view.bottomAnchor, trailing: view.trailingAnchor, padding: .zero)
        
    }
    override func viewWillAppear(_ animated: Bool) {
        sideView.isHidden = true
        
//        customers.removeAll()
//        drivers.removeAll()
//        owners.removeAll()
        self.customers = DataRepo.getInstance().getAllCustomers()
        self.drivers = DataRepo.getInstance().getAlldrivers()
        self.owners = DataRepo.getInstance().getAllOwners()
        self.tableView.reloadData()
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
            return rowsToDisplay.count
        }
        }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        if tableView == sideTblView{
        let cell : SideMenuTableViewCell = tableView.dequeueReusableCell(withIdentifier: "sideCell") as! SideMenuTableViewCell
        cell.img.image = arrImg[indexPath.row]
        cell.lbl.text = arrData[indexPath.row]
        return cell
        }
        else {
            let cell = UITableViewCell()
            let c = rowsToDisplay[indexPath.row]
            cell.textLabel?.text = "\(c.firstName) \(c.lastName)"
            return cell
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
    
}



