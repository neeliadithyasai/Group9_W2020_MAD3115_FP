//
//  addNewCustomerViewController.swift
//  Group9_W2020_MAD3115_FP
//
//  Created by adithyasai neeli on 2020-03-25.
//  Copyright © 2020 adithyasai neeli. All rights reserved.
//

import UIKit

class addNewCustomerViewController: UIViewController {

    @IBOutlet weak var txtCustomerId: UITextField!
    
    @IBOutlet weak var txtCustomerName: UITextField!
    
    
    @IBOutlet weak var txtCustomerLastName: UITextField!
    
    @IBOutlet weak var txtCustomerGender: UITextField!
    
    @IBOutlet weak var txtCustomerAge: UITextField!
    
    
    @IBOutlet weak var txtCustomerMobileNumber: UITextField!
    
    @IBOutlet weak var txtCustomerEmailId: UITextField!
    
    @IBOutlet weak var txtCustomerAddress: UITextField!
    
    
    @IBOutlet weak var txtCustomerCity: UITextField!
    let types = ["Male","Female"]
    var selectedType : String?
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Add New Customer"
        
        createBillPicker()
        createDatePicker()
        createToolBar()
        
    }
    
    @IBAction func saveCustomer(_ sender: UIButton) {
        if let id = txtCustomerId.text, let fn = txtCustomerName.text,let ln = txtCustomerLastName.text , let gen = txtCustomerGender.text, let age = txtCustomerAge.text, let mob = txtCustomerMobileNumber.text, let em = txtCustomerEmailId.text , let address = txtCustomerAddress.text, let city = txtCustomerCity.text
            
        { if id == "" || fn == "" || ln == "" || gen == "" || age == "" || mob == "" || em == "" || address == "" || city == "" {
            let alertController = UIAlertController(title: "ERROR", message:
                "Incomplete Form", preferredStyle: .alert)
            alertController.addAction(UIAlertAction(title: "Dismiss", style: .default))
            
            self.present(alertController, animated: true, completion: nil)
        }
        else{
            do{
            if gen == "Male"{
                DataRepo.getInstance().addCustomer(customer: try Customer(Id: id, firstName: fn, lastName: ln, gender: Gender.Male, birthDate: age.toDate(), mobileNumber: mob, emailId: em, userName: "\(fn)@gmail.com", password: "\(ln)", address: address, city: city))
                self.navigationController?.popViewController(animated: true)
            }
            else{
                DataRepo.getInstance().addCustomer(customer: try Customer(Id: id, firstName: fn, lastName: ln, gender: Gender.Female, birthDate: age.toDate(), mobileNumber: mob, emailId: em, userName: "\(fn)@gmail.com", password: "\(ln)", address: address, city: city))
                self.navigationController?.popViewController(animated: true)
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
        txtCustomerAge.inputView = datePicker
        
    }
    
    @objc func dateChanged(datePicker: UIDatePicker){
        
        txtCustomerAge.text = datePicker.date.formatToDate()
    }
    
    func createBillPicker(){
        let billPicker = UIPickerView()
        billPicker.delegate = self
        txtCustomerGender.inputView = billPicker
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
        txtCustomerGender.inputAccessoryView = toolBar
        txtCustomerAge.inputAccessoryView = toolBar
        
    }
    @objc func dismissKeyboard(){
        view.endEditing(true)
    }
    @objc func cancelClick(){
        txtCustomerGender.resignFirstResponder()
        txtCustomerAge.resignFirstResponder()
    }

}

extension addNewCustomerViewController: UIPickerViewDataSource, UIPickerViewDelegate{
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
        txtCustomerGender.text = selectedType
    }
    
    
}
