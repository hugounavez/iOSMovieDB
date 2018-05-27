//
//  ViewController.swift
//  MovieDB
//
//  Created by Mac User on 5/27/18.
//  Copyright © 2018 Hugo. All rights reserved.
//

import UIKit
import SnapKit

class ViewController: UIViewController {

    
    let mainView = HomeMainView()
    
    let t : UIButton =
    {
        let t = UIButton()
        t.translatesAutoresizingMaskIntoConstraints = false
        t.setTitle("Marico el que lo lea", for: .normal)
        return t
        
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.view.backgroundColor = .white
        
        self.view.addSubview(self.mainView)
        
        self.mainView.snp.makeConstraints { (make) in
            make.center.width.height.equalTo(self.view)
        }
        
        self.mainView.setupLayout()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

