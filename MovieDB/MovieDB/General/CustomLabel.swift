//
//  CustomLabel.swift
//  MovieDB
//
//  Created by Mac User on 5/27/18.
//  Copyright © 2018 Hugo. All rights reserved.
//

import UIKit

class CustomLabel: UILabel {
    // LogoCategoryc class
    var customTextColor: UIColor?
    var size: CGFloat?
    var aligment: NSTextAlignment?
    
    init(text: String, size: CGFloat, textColor: UIColor = .black, aligment: NSTextAlignment = NSTextAlignment.center){
        // This line is needed to run the super class constructor.
        // The frame is set to zero, because the size of the class
        // will be changed in the future
        super.init(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
        
        
        self.font = UIFont(name: "AmericanTypewriter" , size: size)
        self.textColor = textColor
        self.textAlignment = aligment
        self.text = text
        self.translatesAutoresizingMaskIntoConstraints = false
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

