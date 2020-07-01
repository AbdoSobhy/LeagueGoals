//
//  HomeViewControllerPresenter.swift
//  LeagueGoals
//
//  Created by Abdelrahman Sobhy on 7/2/20.
//  Copyright © 2020 Macbook pro. All rights reserved.
//

import Foundation
protocol HomeViewControllelrView : AnyObject {
    
}
protocol HomeViewControllerPresenter {
    
}
class HomeViewControllerPresenterImpl {
    weak var view : HomeViewControllelrView?
    
    init(view : HomeViewControllelrView) {
        self.view = view
    }
}
extension HomeViewControllerPresenterImpl : HomeViewControllerPresenter{
    
}
