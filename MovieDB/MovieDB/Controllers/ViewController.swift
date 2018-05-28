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
import Alamofire


class ViewController: UIViewController, UICollectionViewDelegate {

    
    let mainView = HomeMainView()
    
    lazy var viewModel : HomeMainViewModel = {
        return HomeMainViewModel()
    }()

    let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
  
        self.view.backgroundColor = .white
        
        self.view.addSubview(self.mainView)
        
        self.mainView.snp.makeConstraints { (make) in
            make.center.width.height.equalTo(self.view)
        }
        
        self.mainView.collectionView.register(HomeMainViewCell.self, forCellWithReuseIdentifier: "HomeMainViewCell")
     
        self.mainView.collectionView.delegate = self
        
        self.mainView.setupLayout()
        self.bindViewElements()
        
        
        
        let m = MyService()
        m.getMovieList(category: "popularity.desc") { (response) in
            print(response)
        }
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func bindViewElements(){
        self.viewModel.movies.asObservable().bind(to: self.mainView.collectionView.rx.items(cellIdentifier: "HomeMainViewCell")){  row, model, cell in
            if let movieCollectionCell = cell as? HomeMainViewCell{
                movieCollectionCell.setupLayout()
                movieCollectionCell.title.text = "mmm"
                
            }
            
        }.disposed(by: self.disposeBag)
        
   
 
        
        
        
    }
    
    
}

