//
//  API.swift
//  headerHTTP
//
//  Created by 丁暐哲 on 2016/6/16.
//  Copyright © 2016年 Din. All rights reserved.
//

import Foundation


class FirstAPI {
    
    
    func ConnectAPI(completion:((Shots) -> Void), firstNumber: Int,secondNumber: Int){
        let url = "https://test.wanting.athene.idv.tw/training/add.php"
        let oneURL = NSURL(string: url)
        let session = NSURLSession.sharedSession()
        let request = NSMutableURLRequest(URL: oneURL!)
        request.HTTPMethod = "GET"
        request.setValue("\(firstNumber)", forHTTPHeaderField:  "a")
        request.setValue("\(secondNumber)", forHTTPHeaderField:  "b")

        
        let task = session.dataTaskWithRequest(request){(data,response: NSURLResponse?,error)  in

//            let httpUrlResponse = response as? NSHTTPURLResponse
//            print("\(httpUrlResponse!.allHeaderFields)")
            let dataString = NSString(data: data!, encoding: NSUTF8StringEncoding)
            print(dataString)
            
            do {
                let shotData = try NSJSONSerialization.JSONObjectWithData(data!, options: .MutableContainers) as! NSDictionary
                
                let somedata = Shots(data: shotData)
                print(somedata.reslut)
                let priority = DISPATCH_QUEUE_PRIORITY_DEFAULT
                dispatch_async(dispatch_get_global_queue(priority, 0)) {
                    dispatch_async(dispatch_get_main_queue()) {
                        completion(somedata)
                        
                    }
                }
            }catch{
                print("error = \(error)")
            }
            
        }
        task.resume()
    }
    
}