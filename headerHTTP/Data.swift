//
//  Data.swift
//  headerHTTP
//
//  Created by 丁暐哲 on 2016/6/16.
//  Copyright © 2016年 Din. All rights reserved.
//

import Foundation

class Shots {
    var reslut:String
    
    init(data:NSDictionary){
        self.reslut = data["result"] as? String ?? ""
    }
}

class Parameter {
    var a:Int = 1
    var b:Int = 1
}

