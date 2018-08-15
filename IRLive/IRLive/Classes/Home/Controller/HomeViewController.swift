//
//  HomeViewController.swift
//  IRLive
//
//  Created by Phil on 2018/8/15.
//  Copyright © 2018年 Phil. All rights reserved.
//

import UIKit

private let kTitleViewH : CGFloat = 40

class HomeViewController: UIViewController {
    private lazy var pageTitleView : PageTitleView = {
        let titleFrame = CGRect(x: 0, y: kStatusBarH + kNavigationBarH, width: kScreenW, height: kTitleViewH)
        let titles = ["推薦", "遊戲", "娛樂", "趣玩"]
        let titleView = PageTitleView(frame: titleFrame, titles: titles)
        
        return titleView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //設置UI介面
        setupUI()
    }
}

// MARK: - 設置UI介面
extension HomeViewController {
    private func setupUI() {
        // 1.設置導航欄
        setupNavigationBar()
    }
    
    private func setupNavigationBar() {
        // 1.設置左側的Item
        navigationItem.leftBarButtonItem = UIBarButtonItem(imageName: "logo")
        
        // 2.設置右側的Item
        let size = CGSize(width: 40, height: 40)
        let historyItem = UIBarButtonItem(imageName: "image_my_history", highImageName: "Image_my_history_click", size: size)
        let searchItem = UIBarButtonItem(imageName: "btn_search", highImageName: "btn_search_clicked", size: size)
        let qrcodeItem = UIBarButtonItem(imageName: "Image_scan", highImageName: "Image_scan_click", size: size)
        navigationItem.rightBarButtonItems = [historyItem, searchItem, qrcodeItem]
    }
}
