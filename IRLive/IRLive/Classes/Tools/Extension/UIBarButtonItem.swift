//
//  UIBarButtonItem.swift
//  IRLive
//
//  Created by Phil on 2018/8/15.
//  Copyright © 2018年 Phil. All rights reserved.
//

import UIKit

extension UIBarButtonItem {
    /*
    class func createItem(imageName : String, highImageName : String, size : CGSize) -> UIBarButtonItem {
        let btn = UIButton()
        
        btn.setImage(UIImage(named: imageName), for: .normal)
        btn.setImage(UIImage(named: highImageName), for: .highlighted)
        btn.frame = CGRect(origin: CGPoint.zero, size: size)
        
        return UIBarButtonItem(customView: btn)
    }
    */
    
    // 便利構造函數: 1. convenience開頭 2. 在構造函數中必須調用一個self構造函數
    convenience init(imageName : String, highImageName : String = "", size : CGSize = CGSize.zero) {
        let btn = UIButton()
        
        btn.setImage(UIImage(named: imageName), for: .normal)
        if highImageName != "" {
            btn.setImage(UIImage(named: highImageName), for: .highlighted)
        }
        
        if size == CGSize.zero {
            btn.sizeToFit()
        } else {
            btn.frame = CGRect(origin: CGPoint.zero, size: size)
        }
        
        self.init(customView: btn)
    }
}
