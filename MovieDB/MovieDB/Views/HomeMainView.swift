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
        let collectionFlowLayout = UICollectionViewFlowLayout()
        collectionFlowLayout.itemSize = CGSize.zero
        collectionFlowLayout.scrollDirection = .vertical
        return collectionFlowLayout
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
        
        self.addSubview(self.segmentedControl)
        self.segmentedControl.snp.makeConstraints { (make) in
            make.top.equalTo(self).offset(20)
            make.centerX.width.equalTo(self)
            make.height.equalTo(40)
            
        }
        
        
        self.addSubview(self.collectionView)
        self.collectionView.snp.makeConstraints { (make) in
            make.centerX.bottom.equalTo(self)
            make.width.equalTo(self).multipliedBy(0.5)
            make.top.equalTo(self).offset(50)
        }
        
        self.collectionView.backgroundColor = .orange
        
        self.layoutIfNeeded()
        self.collectionViewFlowLayout.itemSize = CGSize(width: self.frame.width, height: 90)
        self.collectionView.collectionViewLayout = self.collectionViewFlowLayout
        
    }
    
    
}
