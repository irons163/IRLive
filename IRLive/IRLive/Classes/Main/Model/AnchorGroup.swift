//
//  AnchorGroup.swift
//  IRLive
//
//  Created by Phil on 2018/8/20.
//  Copyright © 2018年 Phil. All rights reserved.
//

import UIKit

class AnchorGroup : NSObject {
    @objc var room_list : [[String : NSObject]]? {
        didSet {
            guard let room_list = room_list else {
                return
            }
            
            for dict in room_list {
                anchors.append(AnchorModel(dict: dict))
            }
        }
    }
    
    @objc var tag_name : String = ""
    @objc var icon_name : String = "home_header_normal"
    lazy var anchors : [AnchorModel] = [AnchorModel]()
    
    override init() {
        
    }
    
    init(dict : [String : Any]) {
        super.init()
        
        setValuesForKeys(dict)
    }
    
    override func setValue(_ value: Any?, forUndefinedKey key: String) {}
}
