//
//  AddDriverViewController.swift
//  Group9_W2020_MAD3115_FP
//
//  Created by Mohit Kumar on 2020-03-26.
//  Copyright © 2020 adithyasai neeli. All rights reserved.
//

import UIKit

class AddDriverViewController: UIViewController {

    @IBOutlet weak var driverId: UITextField!
    
    @IBOutlet weak var driverFirstName: UITextField!
    
    @IBOutlet weak var driverLastName: UITextField!
    
    @IBOutlet weak var driverBirthDate: UITextField!
    
    @IBOutlet weak var driverGender: UITextField!
    
    @IBOutlet weak var driverMobile: UITextField!
    
    @IBOutlet weak var driverEmail: UITextField!
    
    @IBOutlet weak var driverLicense: UITextField!
    
    @IBOutlet weak var driverSalary: UITextField!
    let types = ["Male","Female"]
    var selectedType : String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createBillPicker()
        createDatePicker()
        createToolBar()
    }
    
    
    
    @IBAction func saveDriver(_ sender: UIButton) {
        if let id = driverId.text, let fn = driverFirstName.text,let ln = driverLastName.text , let gen = driverGender.text, let bd = driverBirthDate.text, let mob = driverMobile.text, let em = driverEmail.text , let license = driverLicense.text, let salary = driverSalary.text
        { if id == "" || fn == "" || ln == "" || gen == "" || bd == "" || mob == "" || em == "" || license == "" || salary == "" {
            let alertController = UIAlertController(title: "ERROR", message:
                "Incomplete Form", preferredStyle: .alert)
            alertController.addAction(UIAlertAction(title: "Dismiss", style: .default))
            
            self.present(alertController, animated: true, completion: nil)
        }
        else{
            do{
                if gen == "Male"{
                    DataRepo.getInstance().addriver(driver: try Driver(Id: id, firstName: fn, lastName: ln, gender: Gender.Male, birthDate: bd.toDate(), mobileNumber: mob, emailId: em, userName: "\(fn)@gmail.com", password: "\(ln)", driverLicenceNumber: license, driverHistoryClear: true, salary: Double(salary)!))
            }
                else {
                    DataRepo.getInstance().addriver(driver: try Driver(Id: id, firstName: fn, lastName: ln, gender: Gender.Female, birthDate: bd.toDate(), mobileNumber: mob, emailId: em, userName: "\(fn)@gmail.com", password: "\(ln)", driverLicenceNumber: license, driverHistoryClear: true, salary: Double(salary)!))
                }
                
            }catch {
                print("Unrecognised Error")
            }

        }
    
}
}
    func createDatePicker(){
        let datePicker = UIDatePicker()
        datePicker.datePickerMode = .date
        datePicker.addTarget(self, action: #selector(addNewCustomerViewController.dateChanged(datePicker:)), for: .valueChanged)
        driverBirthDate.inputView = datePicker
        
    }
    
    @objc func dateChanged(datePicker: UIDatePicker){
        
        driverBirthDate.text = datePicker.date.formatToDate()
    }
    
    func createBillPicker(){
        let billPicker = UIPickerView()
        billPicker.delegate = self
        driverGender.inputView = billPicker
        billPicker.backgroundColor = .white
    }
    func createToolBar(){
        let toolBar = UIToolbar()
        toolBar.sizeToFit()
        
        let doneButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(addNewCustomerViewController.dismissKeyboard))
        let spaceButton = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let cancelButton = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(addNewCustomerViewController.cancelClick))
        toolBar.setItems([cancelButton,spaceButton,doneButton], animated: true)
        toolBar.isUserInteractionEnabled = true
        driverGender.inputAccessoryView = toolBar
        driverBirthDate.inputAccessoryView = toolBar
        
    }
    @objc func dismissKeyboard(){
        view.endEditing(true)
    }
    @objc func cancelClick(){
        driverGender.resignFirstResponder()
        driverBirthDate.resignFirstResponder()
    }
}
extension AddDriverViewController: UIPickerViewDataSource, UIPickerViewDelegate{
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return types.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return types[row]
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        selectedType = types[row]
        driverGender.text = selectedType
    }
    
    
}

