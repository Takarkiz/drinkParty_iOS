//
//  ListViewController.swift
//  nomitter
//
//  Created by 澤田昂明 on 2017/03/08.
//  Copyright © 2017年 takarki. All rights reserved.
//

import UIKit
import Firebase

class ListViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {

    @IBOutlet var table:UITableView!
    
    // MARK: Properties
    var items: [database] = []
    var user: User!
    let ref = FIRDatabase.database().reference()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("ViewDidload")
        
        //ログインしているユーザー情婦を取得
        FIRAuth.auth()!.addStateDidChangeListener { auth, user in
            
            //ログインが完了していなかったら、ログイン画面へとぶ
            if user != nil{
                guard let user = user else {    return  }
                self.user = User(authData: user)
                print("ユーザー認証完了")
                
            }else{
                print("ユーザー登録し直してください")
                self.performSegue(withIdentifier: "login", sender: nil)
            }
            
            
        }


        let newRef = ref.child(user.uid).child("event")

        // 1
        newRef.observe(.value, with: { snapshot in
            // 2
            var newItems: [database] = []
            
            // 3
            for item in snapshot.children {
                // 4
                let eventItem = database(snapshot: item as! FIRDataSnapshot)
                newItems.append(eventItem)
            }
            
            // 5
            self.items = newItems
            self.table.reloadData()
        })
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath as IndexPath)
        
        return cell
    }
    
    @IBAction func add(){
        self.performSegue(withIdentifier: "add", sender: nil)
    }
    
    

}
