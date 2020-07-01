//
//  DetailsViewControllerPresenter.swift
//  LeagueGoals
//
//  Created by Abdelrahman Sobhy on 7/2/20.
//  Copyright © 2020 Macbook pro. All rights reserved.
//

import Foundation
protocol DetailsViewControllerView : AnyObject {
    
}
protocol DetailsViewControllerPresenter {
    
}
class DetailsViewControllerPresenterImpl {
    weak var view : DetailsViewControllerView?
    
    init(view : DetailsViewControllerView) {
        self.view = view
    }
}
extension DetailsViewControllerPresenterImpl : DetailsViewControllerPresenter {
    
}
