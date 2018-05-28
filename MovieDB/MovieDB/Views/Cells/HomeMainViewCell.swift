//
//  HomeMainViewCell.swift
//  MovieDB
//
//  Created by Mac User on 5/27/18.
//  Copyright © 2018 Hugo. All rights reserved.
//

import UIKit

class HomeMainViewCell: UICollectionViewCell {
    
    let mainButton : UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let mainImage : UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()

    let title : CustomLabel = CustomLabel(
        text: "This is a movie test",
        size: 24,
        aligment: .center)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupLayout(){
        
        self.addSubview(self.mainButton)
        self.mainButton.snp.makeConstraints { (make) in
            make.center.equalTo(self)
            make.width.height.equalTo(self).multipliedBy(0.80)
        }
        
        self.mainButton.addSubview(self.title)
        self.title.snp.makeConstraints { (make) in
            make.centerX.width.equalTo(self.mainButton)
            make.bottom.equalTo(self.mainButton.snp.bottom)
            make.height.equalTo(30)
        }

        
        self.mainButton.addSubview(self.mainImage)
        self.mainImage.snp.makeConstraints { (make) in
            make.centerX.width.equalTo(self.mainButton)
            make.top.equalTo(self.mainButton)
            make.bottom.equalTo(self.title.snp.top)
            
        }
        
        
                self.mainButton.layer.masksToBounds = false
        self.mainButton.layer.cornerRadius = 5
        self.mainButton.layer.shadowColor = UIColor.black.cgColor
        self.mainButton.layer.shadowRadius = 30
        self.mainButton.layer.shadowOpacity = 1
        
        self.mainButton.layer.borderWidth = 0.2
        self.mainButton.layer.borderColor = UIColor.black.cgColor

        
        self.mainButton.layoutIfNeeded()
        
    }
    
}

