//
//  AddEventViewController.swift
//  nomitter
//
//  Created by 澤田昂明 on 2017/03/08.
//  Copyright © 2017年 takarki. All rights reserved.
//

import UIKit

class AddEventViewController: UIViewController,UITextFieldDelegate {

    //入力用のTextField
    @IBOutlet var titleTextField :UITextField!
    @IBOutlet var stateTextField:UITextField!
    @IBOutlet var dateTextField:UITextField!
    @IBOutlet var localTextField:UITextField!
    @IBOutlet var memoTextField:UITextField!
    
    //Databaseのインスタンスを生成
    var datafile:database = database()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //各delegateを宣言
        titleTextField.delegate = self
        stateTextField.delegate = self
        dateTextField.delegate = self
        localTextField.delegate = self
        memoTextField.delegate = self
        
        
    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    //『完了』ボタン
    @IBAction func finishButton(){
        
    }
    


}
