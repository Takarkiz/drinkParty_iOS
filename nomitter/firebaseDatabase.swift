//
//  firebaseDatabase.swift
//  nomitter
//
//  Created by 澤田昂明 on 2017/03/08.
//  Copyright © 2017年 takarki. All rights reserved.
//

import Foundation


struct database{
    
    //プロパティの宣言
    var title:String!
    var state:String!
    var date:String!
    var local:String!
    var memo:String!
    var adana:String!
    
    var dictionary:Dictionary<String, Any>!
    
    //イニシャライザ
    init(_ title:String,_ state:String,_ date:String,_ local:String,_ memo:String,_ adana:String){
        self.title = title
        self.state = state
        self.date = date
        self.local = memo
        self.memo = memo
        self.adana = adana
    }
    
    init(){
        
    }
    
    func dic(){
        
    }
    
    
}
