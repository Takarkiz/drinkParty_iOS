//
//  DetailsetViewController.swift
//  nomitter
//
//  Created by 澤田昂明 on 2017/03/08.
//  Copyright © 2017年 takarki. All rights reserved.
//

import UIKit
import Firebase

class DetailsetViewController: UIViewController,UITextFieldDelegate {
    
    @IBOutlet var adanaTextField:UITextField!
    @IBOutlet var imageView:UIImageView!
    
    //MARK:Proparty
    var user: User!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        adanaTextField.delegate = self
        
        //ログインしているユーザー情婦を取得
        FIRAuth.auth()!.addStateDidChangeListener { auth, user in
            
            guard let user = user else {  return  }
            self.user = User(authData: user)
            
        }
    }
    
    @IBAction func edit(){
        guard let adana = adanaTextField.text else {    return    }
        
        let currentUser = FIRAuth.auth()?.currentUser?.profileChangeRequest()
        currentUser?.displayName = adana
        //新規登録完了
        print("userName登録完了")
        //画面遷移
        self.toListView()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    private func toListView(){
        performSegue(withIdentifier: "toListView", sender: nil)
    }
}
