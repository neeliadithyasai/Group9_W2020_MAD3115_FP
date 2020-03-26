//
//  AllVehiclesViewController.swift
//  Group9_W2020_MAD3115_FP
//
//  Created by Mohit Kumar on 2020-03-26.
//  Copyright © 2020 adithyasai neeli. All rights reserved.
//

import UIKit

class AllVehiclesViewController: UIViewController {

    let segmentedControl : UISegmentedControl = {
        let sc = UISegmentedControl(items: ["Cars","Motorcycles","Buses"])
        return sc
    }()
    
    let tableView = UITableView(frame: .zero, style: .plain)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        navigationItem.title = "All Vehicles"
        
        let stackView = UIStackView(arrangedSubviews: [segmentedControl,tableView])
        stackView.axis = .vertical
        
        view.addSubview(stackView)
        stackView.anchor(top: <#T##NSLayoutYAxisAnchor?#>, leading: <#T##NSLayoutXAxisAnchor?#>, bottom: <#T##NSLayoutYAxisAnchor?#>, trailing: <#T##NSLayoutXAxisAnchor?#>, padding: <#T##UIEdgeInsets#>, size: <#T##CGSize#>)
        
        
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
