//
//  ViewController.swift
//  Group9_W2020_MAD3115_FP
//
//  Created by adithyasai neeli on 2020-03-15.
//  Copyright © 2020 adithyasai neeli. All rights reserved.
//

import UIKit

class loginViewController: UIViewController {
    
    @IBOutlet weak var txtUserName: UITextField!
    
    @IBOutlet weak var txtPassword: UITextField!
    
    @IBOutlet weak var btnLogin: UIButton!
    
    @IBOutlet weak var switchRememberMe: UISwitch!
    
    enum LoginError: Error{
        case emailError, passwordError, incomplete
    }
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
         
               let ud = UserDefaults.standard
               let e = ud.string(forKey: "email")
               let p = ud.string(forKey: "password")
               
               if let em = e {
                   txtUserName.text = "\(em)"
               }
               
               if let pa = p {
                   txtPassword.text = "\(pa)"
               }
    }
    
    func getPlist(withName name: String) -> [String: String]?
    {
        if  let path = Bundle.main.path(forResource: name, ofType: "plist"),
            let xml = FileManager.default.contents(atPath: path)
        {
            return (try? PropertyListSerialization.propertyList(from: xml, options: .mutableContainersAndLeaves, format: nil)) as? [String: String]
        }
        
        return nil
    }
    
    
    @IBAction func btnLogin(_ sender: UIButton)
        
    {
        guard let access = getPlist(withName: "Access") else{
            print("no no")
            return
        }
        
        var canEnter = false
        for (k,v) in access
        {
            if txtUserName.text! == k && txtPassword.text! == v
            {
                canEnter = true
            }
        }
        if canEnter
        {

                if switchRememberMe.isOn
                {
                    UserDefaults.standard.set(txtUserName.text, forKey: "email")
                    UserDefaults.standard.set(txtPassword.text, forKey: "password")
                    
                    let ud = UserDefaults.standard
                    let email = ud.string(forKey: "email")
                    txtUserName.text = email
                    let password = ud.string(forKey: "password")
                    txtPassword.text = password
                    
                }else
                {
                    UserDefaults.standard.removeObject(forKey: "email")
                    UserDefaults.standard.removeObject(forKey: "password")
                    txtUserName.text = ""
                    txtPassword.text = ""
                }
                
           
            
        }
        else
        {
            
            let alertController = UIAlertController(title: "Username or Password Incorrect", message: "Please check Username or password", preferredStyle: .alert)
            let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            
            alertController.addAction(defaultAction)
            self.present(alertController, animated: true, completion: nil)
            
            
            
        }
        
        
    }
    
    
    

}

