//
//  AddEventViewController.swift
//  nomitter
//
//  Created by 澤田昂明 on 2017/03/08.
//  Copyright © 2017年 takarki. All rights reserved.
//

import UIKit
import Firebase

class AddEventViewController: UIViewController,UITextFieldDelegate {
    
    //入力用のTextField
    @IBOutlet var titleTextField :UITextField!
    @IBOutlet var stateTextField:UITextField!
    @IBOutlet var dateTextField:UITextField!
    @IBOutlet var localTextField:UITextField!
    @IBOutlet var memoTextField:UITextField!
    
    
    // MARK: Properties
    var items: [database] = []
    var user: User!
    let ref = FIRDatabase.database().reference()
    
    
    //    MARK:UIViewController Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //各delegateを宣言
        titleTextField.delegate = self
        stateTextField.delegate = self
        dateTextField.delegate = self
        localTextField.delegate = self
        memoTextField.delegate = self
        
        //ログインしているユーザー情婦を取得
        FIRAuth.auth()!.addStateDidChangeListener { auth, user in
            
            //ログインが完了していなかったら、ログイン画面へとぶ
            if user != nil{
                self.performSegue(withIdentifier: "login", sender: nil)
            }else{
                guard let user = user else {    return  }
                self.user = User(authData: user)
            }
        }
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    //『完了』ボタン
    @IBAction func finishButton(){
        
        //        入力されているか
        guard let title = titleTextField.text else {    return  }
        guard let state = stateTextField.text else {    return  }
        guard let date = dateTextField.text else {    return  }
        guard let local = localTextField.text else {    return  }
        var memo:String = "特になし"
        if memoTextField.text != nil{
            memo = memoTextField.text!
        }
        let adana = FIRAuth.auth()?.currentUser?.displayName!
        
        let setItem = database(title:title, state:state, date:date, local:local, memo: memo, adana: adana!)
        //        新たなchildを生成
        let itemRef = self.ref.child(user.uid).child(title)
        //        データをセット
        itemRef.setValue(setItem.toAnyObject())
        
    }
    
    
    
}
