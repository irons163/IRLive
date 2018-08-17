//
//  MainViewViewController.swift
//  IRLive
//
//  Created by Phil on 2018/8/15.
//  Copyright © 2018年 Phil. All rights reserved.
//

import UIKit

class MainViewViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

//        addChildVC(storyName: "Home")
//        addChildVC(storyName: "Live")
//        addChildVC(storyName: "Follow")
//        addChildVC(storyName: "Profile")
    }

    private func addChildVC(storyName : String) {
        // 1.通過storyboard獲取控制器
        let childVC = UIStoryboard(name: "Home", bundle: nil).instantiateInitialViewController()!
        
        // 2.請將childVC作為子控制器
        addChildViewController(childVC)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
