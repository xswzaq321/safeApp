//
//  ViewController.swift
//  safeApp
//
//  Created by 涂維元 on 2017/12/27.
//  Copyright © 2017年 涂維元. All rights reserved.
//

import UIKit
import FirebaseAuth
class ViewController: UIViewController {
    @IBOutlet weak var emailText: UITextField!
    @IBOutlet weak var passwordText: UITextField!
    @IBOutlet weak var segmentCOntrol: UISegmentedControl!
    @IBOutlet weak var actionButton: UIButton!
    
    
    @IBAction func action(_ sender: UIButton) {
        if emailText.text != "" && passwordText.text != ""
        {
            if segmentCOntrol.selectedSegmentIndex == 0
            {
                Auth.auth().signIn(withEmail: emailText.text!, password: passwordText.text!, completion:{ (user, error)in
                    if user != nil{
                        //Sign in Successful
                    }
                    else{
                        if let myError = error?.localizedDescription{
                            print(myError)
                        }
                        else{
                            print("ERROR")
                        }
                    }
            })
        }
        else //Sign up user
            {
                Auth.auth().createUser(withEmail: emailText.text!, password: passwordText.text!, completion: { (user, error) in
                    if user != nil{
                        print("success")
                    }
                    else{
                        if let myError = error?.localizedDescription{
                            print(myError)
                        }
                        else{
                            print("ERROR")
                        }
                    }
                })
            }
    }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


