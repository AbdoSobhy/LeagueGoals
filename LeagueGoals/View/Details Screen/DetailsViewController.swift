//
//  DetailsViewController.swift
//  LeagueGoals
//
//  Created by Abdelrahman Sobhy on 7/2/20.
//  Copyright © 2020 Macbook pro. All rights reserved.
//

import UIKit

class DetailsViewController: UIViewController {
    var detailsViewControllerPresenter : DetailsViewControllerPresenter?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        detailsViewControllerPresenter = DetailsViewControllerPresenterImpl(view: self)
        // Do any additional setup after loading the view.
    }
    
}
extension DetailsViewController : DetailsViewControllerView {
    
}
