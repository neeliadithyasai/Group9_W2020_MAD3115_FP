//
//  AllVehiclesViewController.swift
//  Group9_W2020_MAD3115_FP
//
//  Created by Mohit Kumar on 2020-03-26.
//  Copyright © 2020 adithyasai neeli. All rights reserved.
//

import UIKit

class AllVehiclesViewController: UIViewController {

    lazy var cars : [Vehicle] = []
    lazy var motorcycles : [Vehicle] = []
    lazy var buses : [Vehicle] = []
    
    let segmentedControl : UISegmentedControl = {
        let sc = UISegmentedControl(items: ["Cars","Motorcycles","Buses"])
        sc.selectedSegmentIndex = 0
        sc.addTarget(self, action: #selector(handleSegmentChange), for: .valueChanged)
        return sc
    }()
    
    @objc func handleSegmentChange(){
        switch segmentedControl.selectedSegmentIndex{
        case 0 :
            rowsToDisplay = cars
        case 1 :
            rowsToDisplay = motorcycles
        default :
            rowsToDisplay = buses
        }
        tableView.reloadData()
    }
    
    let tableView = UITableView(frame: .zero, style: .plain)
    lazy var rowsToDisplay = cars
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        navigationItem.title = "All Vehicles"
        let paddedStackView = UIStackView(arrangedSubviews: [segmentedControl])
        paddedStackView.layoutMargins = .init(top: 12, left: 12, bottom: 12, right: 12)
        paddedStackView.isLayoutMarginsRelativeArrangement = true
        tableView.dataSource = self
        tableView.delegate = self
        let stackView = UIStackView(arrangedSubviews: [paddedStackView,tableView])
        stackView.axis = .vertical
        
        view.addSubview(stackView)
        stackView.anchor(top: view.safeAreaLayoutGuide.topAnchor, leading: view.leadingAnchor, bottom: view.bottomAnchor, trailing: view.trailingAnchor, padding: .zero)
        cars = DataRepo.getInstance().getAllCars()
        motorcycles = DataRepo.getInstance().getAllmotorcycles()
        buses = DataRepo.getInstance().getAllbuses()
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

extension AllVehiclesViewController: UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return rowsToDisplay.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        let c = rowsToDisplay[indexPath.row]
        cell.textLabel?.text = c.manufacturer_name
        return cell
    }
    
    
}
