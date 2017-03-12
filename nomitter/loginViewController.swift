//
//  loginViewController.swift
//  nomitter
//
//  Created by 澤田昂明 on 2017/03/08.
//  Copyright © 2017年 takarki. All rights reserved.
//

import UIKit

class loginViewController: UIViewController,UITextFieldDelegate {
    
    @IBOutlet var mailTextField:UITextField!
    @IBOutlet var passTextField:UITextField!

    
    override func viewDidLoad() {
        super.viewDidLoad()

        //initialize delegateMethod
        mailTextField.delegate = self
        passTextField.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //変種終了時の処理
    @IBAction func editDone(){
        
    }
    
    private func toList(){
        performSegue(withIdentifier:"toList", sender: nil)
    }
    



}
