//
//  DetailsetViewController.swift
//  nomitter
//
//  Created by 澤田昂明 on 2017/03/08.
//  Copyright © 2017年 takarki. All rights reserved.
//

import UIKit

class DetailsetViewController: UIViewController,UITextFieldDelegate {
    
    @IBOutlet var adanaTextField:UITextField!
    @IBOutlet var imageView:UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()

        adanaTextField.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    private func toListView(){
        performSegue(withIdentifier: "toListView", sender: nil)
    }
}
