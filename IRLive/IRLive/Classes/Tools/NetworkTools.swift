//
//  NetworkTools.swift
//  IRLive
//
//  Created by Phil on 2018/8/17.
//  Copyright © 2018年 Phil. All rights reserved.
//

import UIKit
import Alamofire

enum MethodType {
    case get
    case post
}

class NetworkTools {
    class func requestData(_ type : MethodType, urlString : String, parameters : [String : Any]? = nil, finishedCallback : @escaping (_ request : Any) -> ()) {
        
        let method = type == .get ? HTTPMethod.get : HTTPMethod.post
        
        Alamofire.request(urlString, method: method, parameters: parameters).responseJSON { (response) in
            
            guard let result = response.result.value else {
                print(response.result.error as Any)
                return
            }
            
            finishedCallback(result)
        }
    }
}
