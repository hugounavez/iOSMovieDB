//
//  HomeMainViewCell.swift
//  MovieDB
//
//  Created by Mac User on 5/27/18.
//  Copyright © 2018 Hugo. All rights reserved.
//

import UIKit

class HomeMainViewCell: UICollectionViewCell {
    
    let customview : UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupLayout(){
        self.addSubview(self.customview)
        self.customview.snp.makeConstraints { (make) in
            make.width.height.equalTo(self).multipliedBy(0.8)
            make.center.equalTo(self)
        }
        
        self.customview.backgroundColor = .orange
    }
    
}

