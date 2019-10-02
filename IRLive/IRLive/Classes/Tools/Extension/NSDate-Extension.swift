//
//  NSDate-Extension.swift
//  IRLive
//
//  Created by Phil on 2018/8/20.
//  Copyright © 2018年 Phil. All rights reserved.
//

import Foundation

extension Date {
    static func getCurrentTime() -> String {
        let nowDate = Date()
        
        let interval = Int(nowDate.timeIntervalSince1970)
        
        return "\(interval)"
    }
}
