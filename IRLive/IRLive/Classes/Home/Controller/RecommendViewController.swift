//
//  RecommendViewController.swift
//  IRLive
//
//  Created by Phil on 2018/8/16.
//  Copyright © 2018年 Phil. All rights reserved.
//

import UIKit

private let kItemMargin : CGFloat = 10
private let kItemW = (kScreenW - 3 * kItemMargin) / 2
private let kItemH = kItemW * 3 / 4
private let kHeaderViewH : CGFloat = 50

private let kCycleViewH = kScreenW * 3 / 8

private let kNormalCellID = "kNormalCellID"
private let kPrettyCellID = "kPrettyCellID"
private let kHeaderCellID = "kHeaderCellID"

class RecommendViewController: UIViewController {
    fileprivate lazy var recommendVM : RecommendViewModel = RecommendViewModel()
    fileprivate lazy var cycleView : RecommendCycleView = {
        let cycleView = RecommendCycleView.recommendCycleView()
        cycleView.frame = CGRect(x: 0, y: -(kCycleViewH + 0), width: kScreenW, height: kCycleViewH)
        return cycleView
    }()
    private lazy var collectionView : UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: kItemW, height: kItemH)
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = kItemMargin
        layout.headerReferenceSize = CGSize(width: kScreenW, height: kHeaderViewH)
//        layout.scrollDirection = .vertical
        layout.sectionInset = UIEdgeInsets(top: 0, left: kItemMargin, bottom: 0, right: kItemMargin)
//        layout.itemSize = CGSize(width: kItemW, height: kItemH)
        
        let collectionView = UICollectionView(frame: self.view.bounds, collectionViewLayout: layout)
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.backgroundColor = UIColor.white
        
        collectionView.register(UINib(nibName: "CollectionNormalCell", bundle: nil), forCellWithReuseIdentifier: kNormalCellID)
        collectionView.register(UINib(nibName: "CollectionPrettyCell", bundle: nil), forCellWithReuseIdentifier: kPrettyCellID)
        collectionView.register(UINib(nibName: "CollectionHeaderView", bundle: nil), forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, withReuseIdentifier: kHeaderCellID)
        
        return collectionView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
        
        collectionView.autoresizingMask = [.flexibleHeight]
        
        // 2.将CycleView添加到UICollectionView中
        collectionView.addSubview(cycleView)
        
        loadData()
    }
}

extension RecommendViewController {
    private func setupUI() {
        self.view.addSubview(collectionView)
    }
}

extension RecommendViewController : UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return recommendVM.anchorGroups.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return recommendVM.anchorGroups[section].anchors.count
    }
    
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        if indexPath.section == 1 {
//            return CGSize(width: kItemW, height: kItemH)
//        }
//
//        return CGSize(width: kItemW, height: kItemH)
//    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        var cell : UICollectionViewCell
//
//        if indexPath.section == 1 {
//            cell = collectionView.dequeueReusableCell(withReuseIdentifier: kPrettyCellID, for: indexPath)
//        }
//        else {
//            cell = collectionView.dequeueReusableCell(withReuseIdentifier: kNormalCellID, for: indexPath)
//        }
//        //cell.backgroundColor = UIColor.red
//        return cell
        
        if indexPath.section == 1 {
            // 1.取出PrettyCell
            let prettyCell = collectionView.dequeueReusableCell(withReuseIdentifier: kPrettyCellID, for: indexPath) as! CollectionPrettyCell
            
            // 2.设置数据
            prettyCell.anchor = recommendVM.anchorGroups[indexPath.section].anchors[indexPath.item]
            
            return prettyCell
        } else {
            // 1.取出Cell
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: kNormalCellID, for: indexPath) as! CollectionNormalCell
            
            // 2.给cell设置数据
            cell.anchor = recommendVM.anchorGroups[indexPath.section].anchors[indexPath.item]
            
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: kHeaderCellID, for: indexPath)
        headerView.backgroundColor = UIColor.green
        
        return headerView
    }
}

extension RecommendViewController : UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        var size : CGSize
        if indexPath.section == 1 {
            size = CGSize(width: kItemW, height: kItemH * 2)
        }else{
            size = CGSize(width: kItemW, height: kItemH)
        }
        
        return size
    }
}

// MARK:- 请求数据
extension RecommendViewController {
     func loadData() {
        // 0.给父类中的ViewModel进行赋值
//        baseVM = recommendVM
        
//        recommendVM.requestData {
//            self.collectionView.reloadData()
//        }
        
        // 1.请求推荐数据
        recommendVM.requestData {
            // 1.展示推荐数据
            self.collectionView.reloadData()

            // 2.将数据传递给GameView
            var groups = self.recommendVM.anchorGroups

            // 2.1.移除前两组数据
            groups.removeFirst()
            groups.removeFirst()

            // 2.2.添加更多组
            let moreGroup = AnchorGroup()
            moreGroup.tag_name = "更多"
            groups.append(moreGroup)

//            self.gameView.groups = groups

            // 3.数据请求完成
//            self.loadDataFinished()
        }
        
//        // 2.请求轮播数据
//        recommendVM.requestCycleData {
//            self.cycleView.cycleModels = self.recommendVM.cycleModels
//        }
    }
}
