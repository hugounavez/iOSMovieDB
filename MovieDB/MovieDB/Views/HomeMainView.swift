//
//  HomeMainView.swift
//  MovieDB
//
//  Created by Mac User on 5/27/18.
//  Copyright © 2018 Hugo. All rights reserved.
//

import UIKit
import SnapKit

class HomeMainView: UIView {
    
    let fakeNavBar : UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let titleLabel : UILabel = {
        let title = UILabel()
        title.text = "Home"
        title.textAlignment = .center
        title.translatesAutoresizingMaskIntoConstraints = false
        return title
    }()
    
    let segmentedControl : UISegmentedControl = {
        let items = ["Popular", "Rated", "Upcomming"]
        let segmentedControl = UISegmentedControl(items: items)
        segmentedControl.translatesAutoresizingMaskIntoConstraints = false
        return segmentedControl
    }()
    
    let collectionView : UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())

        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()

    lazy var collectionViewFlowLayout : UICollectionViewFlowLayout = {
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        layout.itemSize = CGSize(width: 150, height: 250)
        return layout
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.translatesAutoresizingMaskIntoConstraints = false
        
    }
    
    required init() {
        super.init(frame: .zero)
        self.translatesAutoresizingMaskIntoConstraints = false
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func setupLayout(){
        self.layoutIfNeeded()
        
        self.createFakeNavBar()
        
        self.addSubview(self.segmentedControl)
        self.segmentedControl.snp.makeConstraints { (make) in
            make.top.equalTo(self.fakeNavBar.snp.bottom)
            make.centerX.width.equalTo(self)
            make.height.equalTo(40)
            
        }
        
        self.addSubview(self.collectionView)
        self.collectionView.snp.makeConstraints { (make) in
            make.centerX.bottom.equalTo(self)
            make.width.equalTo(self)
            make.top.equalTo(self.segmentedControl.snp.bottom)
        }
        
        self.collectionView.backgroundColor = .lightGray
        
        self.layoutIfNeeded()
        self.collectionViewFlowLayout.itemSize = CGSize(width: self.frame.width, height: 90)
        self.collectionView.collectionViewLayout = self.collectionViewFlowLayout
        
        
    }
    
    
    func createFakeNavBar(){
        self.addSubview(self.fakeNavBar)
        self.fakeNavBar.snp.makeConstraints { (make) in
            make.width.centerX.equalTo(self)
            make.top.equalTo(self).offset(20)
            make.height.equalTo(44)
        }
        
        self.fakeNavBar.addSubview(self.titleLabel)
        self.titleLabel.snp.makeConstraints { (make) in
            make.center.height.equalTo(self.fakeNavBar)
            make.width.equalTo(self.fakeNavBar).multipliedBy(0.8)
        }
        
        self.titleLabel.backgroundColor = .orange
        
    }
    
}
