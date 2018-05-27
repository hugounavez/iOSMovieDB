//
//  ViewController.swift
//  MovieDB
//
//  Created by Mac User on 5/27/18.
//  Copyright © 2018 Hugo. All rights reserved.
//

import UIKit
import SnapKit
import RxCocoa
import RxSwift

class ViewController: UIViewController, UICollectionViewDelegate {

    
    let mainView = HomeMainView()
    
    lazy var viewModel : HomeMainViewModel = {
        return HomeMainViewModel()
    }()
    
    let t : UIButton =
    {
        let t = UIButton()
        t.translatesAutoresizingMaskIntoConstraints = false
        t.setTitle("Marico el que lo lea", for: .normal)
        return t
        
    }()
    
    let disposeBag = DisposeBag()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.view.backgroundColor = .white
        
        self.view.addSubview(self.mainView)
        
        self.mainView.snp.makeConstraints { (make) in
            make.center.width.height.equalTo(self.view)
        }
        
        self.mainView.collectionView.register(HomeMainViewCell.self, forCellWithReuseIdentifier: "HomeMainViewCell")
        
        self.mainView.collectionView.delegate = self
        
        self.mainView.setupLayout()
        self.bindViewElements()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func bindViewElements(){
        self.viewModel.movies.asObservable().bind(to: self.mainView.collectionView.rx.items(cellIdentifier: "HomeMainViewCell")){  row, model, cell in
            if let movieCollectionCell = cell as? HomeMainViewCell{
                movieCollectionCell.backgroundColor = .red
            }
            
        }.disposed(by: self.disposeBag)
        
    }
    
    
}

