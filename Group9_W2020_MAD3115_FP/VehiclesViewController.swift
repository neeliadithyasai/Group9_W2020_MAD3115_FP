//
//  carsViewController.swift
//  Group9_W2020_MAD3115_FP
//
//  Created by adithyasai neeli on 2020-03-17.
//  Copyright © 2020 adithyasai neeli. All rights reserved.
//

import UIKit

class VehiclesViewController: UIViewController {

    @IBOutlet weak var tblCars: UITableView!
   
          lazy var carsNames : [Vehicle] = []
            override func viewDidLoad() {
                super.viewDidLoad()
                self.navigationItem.title = "Cars"

                
            }
           
            override func viewWillAppear(_ animated: Bool) {
                carsNames = DataRepo.getInstance().getAllCars()
                   tblCars.reloadData()
            
            }
           
        }

        extension VehiclesViewController: UITableViewDelegate,UITableViewDataSource{
            
            func numberOfSections(in tableView: UITableView) -> Int {
                return 2
            }
            
            func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
                if(section == 0)
                {
                          return "Section 1";
                }
                     else
                {
                          return "Section 2";
                }
            }
            
            func tableView(_ tableView: UITableView, numberOfRowsInSection section:  Int) -> Int {
                return carsNames.count
            }
            
            func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
                let cell = tableView.dequeueReusableCell(withIdentifier: "carCell")
                let car = carsNames[indexPath.row]
                cell?.textLabel?.text = car.manufacturer_name
                
                return cell!
                
            }
            

    }





//
// - (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
//{
//
//      static NSString *CellIdentifier = @"Cell";
//
//      UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
//     if (cell == nil) {
//      cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
//      }
//
// if (indexPath.section==0) {
//     ObjectData *theCellData = [array1 objectAtIndex:indexPath.row];
//     NSString *cellValue =theCellData.category;
//     cell.textLabel.text = cellValue;
// }
// else {
//     ObjectData *theCellData = [array2 objectAtIndex:indexPath.row];
//     NSString *cellValue =theCellData.category;
//     cell.textLabel.text = cellValue;
// }
//     return cell;
// }
