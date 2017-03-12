//
//  makeIdViewController.swift
//  nomitter
//
//  Created by 澤田昂明 on 2017/03/08.
//  Copyright © 2017年 takarki. All rights reserved.
//

import UIKit

class makeIdViewController: UIViewController,UITextFieldDelegate {
    
    @IBOutlet var mailTextField:UITextField!
    @IBOutlet var passTextField:UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()

        mailTextField.delegate = self
        passTextField.delegate = self
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //登録を完了させる
    @IBAction func editDone(){
        
    }
    
    //ログイン画面に移動
    @IBAction func toLogin(){
        performSegue(withIdentifier: "toLogin", sender: nil)
        
    }
    
    
    private func toList(){
        performSegue(withIdentifier: "toset", sender: nil)
    }

}
