//
//  HomeViewController.swift
//  LeagueGoals
//
//  Created by Abdelrahman Sobhy on 7/1/20.
//  Copyright © 2020 Macbook pro. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    var homeViewControllerPresenter : HomeViewControllerPresenter?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        homeViewControllerPresenter = HomeViewControllerPresenterImpl(view : self)
        // Do any additional setup after loading the view.
    }
    
    
}
extension HomeViewController : HomeViewControllelrView {
    
}

