//
//  contactUsViewController.swift
//  Group9_W2020_MAD3115_FP
//
//  Created by adithyasai neeli on 2020-03-26.
//  Copyright © 2020 adithyasai neeli. All rights reserved.
//

import UIKit

class contactUsViewController: UIViewController {

    lazy var customers : [Person] = []
    lazy var drivers : [Person] = []
    lazy var owners : [Person] = []
    
    let segmentedControl : UISegmentedControl = {
           let sc = UISegmentedControl(items: ["customers","drivers","owners"])
           sc.selectedSegmentIndex = 0
           sc.addTarget(self, action: #selector(handleSegmentChange), for: .valueChanged)
           return sc
       }()
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
    
    let tableView = UITableView(frame: .zero, style: .plain)
    lazy var rowsToDisplay = customers
   
    override func viewDidLoad() {
         super.viewDidLoad()
              view.backgroundColor = .white
              navigationItem.title = "All persons"
              let paddedStackView = UIStackView(arrangedSubviews: [segmentedControl])
              paddedStackView.layoutMargins = .init(top: 12, left: 12, bottom: 12, right: 12)
              paddedStackView.isLayoutMarginsRelativeArrangement = true
              tableView.dataSource = self
              tableView.delegate = self
              let stackView = UIStackView(arrangedSubviews: [paddedStackView,tableView])
              stackView.axis = .vertical
              
              view.addSubview(stackView)
              stackView.anchor(top: view.safeAreaLayoutGuide.topAnchor, leading: view.leadingAnchor, bottom: view.bottomAnchor, trailing: view.trailingAnchor, padding: .zero)
              customers = DataRepo.getInstance().getAllCustomers()
              drivers = DataRepo.getInstance().getAlldrivers()
              owners = DataRepo.getInstance().getAllOwners()
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension contactUsViewController: UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return rowsToDisplay.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        let c = rowsToDisplay[indexPath.row]
        cell.textLabel?.text = c.firstName
        return cell
    }
    
    
}
