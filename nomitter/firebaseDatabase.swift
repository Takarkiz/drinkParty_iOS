//
//  firebaseDatabase.swift
//  nomitter
//
//  Created by 澤田昂明 on 2017/03/08.
//  Copyright © 2017年 takarki. All rights reserved.
//

import Foundation
import Firebase


struct database{
    
    //プロパティの宣言
    var title:String!
    var state:String!
    var date:String!
    var local:String!
    var memo:String!
    var adana:String!
    let ref:FIRDatabaseReference?
    
    var dictionary:Dictionary<String, Any>!
    
    //イニシャライザ
    init(title:String,state:String,date:String,local:String,memo:String,adana:String){
        self.title = title
        self.state = state
        self.date = date
        self.local = memo
        self.memo = memo
        self.adana = adana
        self.ref = nil
    }
    
    func toAnyObject() -> Any {
        return [
            "title": title,
            "state": state,
            "date": date,
            "local":local,
            "memo":memo,
            "adana":adana,
        ]
    }
    
    
}
