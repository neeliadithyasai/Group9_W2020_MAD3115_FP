//
//  AddOwnerViewController.swift
//  Group9_W2020_MAD3115_FP
//
//  Created by Mohit Kumar on 2020-03-26.
//  Copyright © 2020 adithyasai neeli. All rights reserved.
//

import UIKit

class AddOwnerViewController: UIViewController {

    @IBOutlet weak var ownerId: UITextField!
    
    @IBOutlet weak var ownerFirstName: UITextField!
    
    @IBOutlet weak var ownerLastName: UITextField!
    
    @IBOutlet weak var ownerGender: UITextField!
    
    @IBOutlet weak var ownerMobile: UITextField!
    
    @IBOutlet weak var ownerBirthdate: UITextField!
    
    @IBOutlet weak var ownerEmail: UITextField!
    
    @IBOutlet weak var ownerCompany: UITextField!
    
    @IBOutlet weak var ownerLandline: UITextField!
    
    @IBOutlet weak var ownerWebsite: UITextField!
    let types = ["Male","Female"]
    var selectedType : String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createBillPicker()
        createDatePicker()
        createToolBar()
    }
 
    @IBAction func saveOwner(_ sender: UIButton) {
        if let id = ownerId.text, let fn = ownerFirstName.text,let ln = ownerLastName.text , let gen = ownerGender.text, let bd = ownerBirthdate.text, let mob = ownerMobile.text, let em = ownerEmail.text , let company = ownerCompany.text, let landline = ownerLandline.text, let website = ownerWebsite.text
                { if id == "" || fn == "" || ln == "" || gen == "" || bd == "" || mob == "" || em == "" || company == "" || landline == "" ||  website == "" {
                    let alertController = UIAlertController(title: "ERROR", message:
                        "Incomplete Form", preferredStyle: .alert)
                    alertController.addAction(UIAlertAction(title: "Dismiss", style: .default))
                    
                    self.present(alertController, animated: true, completion: nil)
                }
                else{
                    do{
                        if gen == "Male"{
                            DataRepo.getInstance().addowner(owner: try Owner(Id: id, firstName: fn, lastName: ln, gender: Gender.Male, birthDate: bd.toDate(), mobileNumber: mob, emailId: em, userName: "\(fn)@gmail.com", password: "\(ln)", companyTitle: company, businessLandLineNumber: landline, website: website))
                    }
                        else {
                            DataRepo.getInstance().addowner(owner: try Owner(Id: id, firstName: fn, lastName: ln, gender: Gender.Female, birthDate: bd.toDate(), mobileNumber: mob, emailId: em, userName: "\(fn)@gmail.com", password: "\(ln)", companyTitle: company, businessLandLineNumber: landline, website: website))
                        }
                        
                    }catch {
                        print("Unrecognised Error")
                    }

                }
            
        }
    }
}
