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
        return sc
    }()
    
    let tableView = UITableView(frame: .zero, style: .plain)
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        navigationItem.title = "All Vehicles"
        tableView.dataSource = self
        tableView.delegate = self
        let stackView = UIStackView(arrangedSubviews: [segmentedControl,tableView])
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
        return cars.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        let c = cars[indexPath.row]
        cell.textLabel?.text = c.manufacturer_name
        return cell
    }
    
    
}
