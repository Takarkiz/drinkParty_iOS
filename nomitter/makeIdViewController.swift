//
//  makeIdViewController.swift
//  nomitter
//
//  Created by 澤田昂明 on 2017/03/08.
//  Copyright © 2017年 takarki. All rights reserved.
//

import UIKit
import Firebase

class makeIdViewController: UIViewController,UITextFieldDelegate {
    
    @IBOutlet var mailTextField:UITextField!
    @IBOutlet var passTextField:UITextField!
    var index:Int = 0
    
    
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
    @IBAction func willSignup(){
        //        データがからの場合は処理を中断
        guard let mail = mailTextField.text else {  return  }
        guard let pass = passTextField.text else {  return  }
        
        self.signup()
    }
    
    @IBAction func willLogin(){
        //        データがからの場合は処理を中断
        guard let mail = mailTextField.text else {  return  }
        guard let pass = passTextField.text else {  return  }
        
        self.login()
        
    }
    
    //signUpの処理を行う
    func signup(){
        FIRAuth.auth()?.createUser(withEmail: mailTextField.text!, password: passTextField.text!){   user, error in
            if error == nil{
                //サインイン成功時
                FIRAuth.auth()?.signIn(withEmail: self.mailTextField.text!, password: self.passTextField.text!){ user, error in
                    if error == nil{
                        let alert:UIAlertController = UIAlertController(title: "登録完了", message: "引き続き登録手続きを行います", preferredStyle: .alert)
                        self.okAlert(alert: alert,index:self.index)
                        
                    }
                    
                }
            }else{
                print(error?.localizedDescription)
            }
        }
    }
    
    //ログインの処理を行う
    func login(){
        FIRAuth.auth()?.signIn(withEmail: self.mailTextField.text!, password: self.passTextField.text!) {user, error in
            if error == nil{
                let alert:UIAlertController = UIAlertController(title: "ログイン完了", message: "", preferredStyle: .alert)
                self.okAlert(alert: alert,index: self.index)
                self.index = 1
                //ログイン成功時
                
            }else{
                //ログイン失敗時
                print(error?.localizedDescription)
            }
        }
    }
    
    private func toList(){
        performSegue(withIdentifier: "toList", sender: nil)
    }
    
    private func toEdit(){
        performSegue(withIdentifier: "toEdit", sender: nil)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == mailTextField {
            passTextField.becomeFirstResponder()
        }
        if textField == passTextField {
            textField.resignFirstResponder()
        }
        return true
    }
    
    //アラートの関数
    func okAlert(alert:UIAlertController,index:Int){
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: {ACTION in
            if index == 0{
                self.toEdit()
            }else{
                self.toList()
            }
        }
            )
        )
        present(alert,animated: true,completion: nil)
        
        
    }
    
}


