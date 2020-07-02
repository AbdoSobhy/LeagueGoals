//
//  DetailsViewController.swift
//  LeagueGoals
//
//  Created by Abdelrahman Sobhy on 7/2/20.
//  Copyright © 2020 Macbook pro. All rights reserved.
//

import UIKit
import Kingfisher
import NVActivityIndicatorView

class DetailsViewController: UIViewController, NVActivityIndicatorViewable {
    @IBOutlet weak private var leaugeLogo: UIImageView!
    @IBOutlet weak private var leaugeName: UILabel!
    @IBOutlet weak private var leaugeSport: UILabel!
    @IBOutlet weak private var leaugeCountry: UILabel!
    @IBOutlet weak private var leaugeDescription: UITextView!
    
    var detailsViewControllerPresenter : DetailsViewControllerPresenter?
    var leaugeId : String?
    override func viewDidLoad() {
        super.viewDidLoad()
        detailsViewControllerPresenter = DetailsViewControllerPresenterImpl(view: self)
        detailsViewControllerPresenter?.getLeaugeDetails(completionHandler: { (leauge) in
            
        })
    }
    @IBAction private func closeBtnWasPressed(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
}
extension DetailsViewController : DetailsViewControllerView {
    func startLoading() {
        self.startAnimating()
    }
    
    func stopLoading() {
        self.stopAnimating()
    }
    func display(leaugeLogo : String ){
        self.leaugeLogo.kf.setImage(with: URL(string: leaugeLogo))
    }
    func display(leaugeName : String){
        self.leaugeName.text = leaugeName
    }
    func display(leaugeSport : String){
        self.leaugeSport.text = leaugeSport
    }
    func display(leaugeCountry : String){
        self.leaugeCountry.text = leaugeCountry
    }
    func display(leaugeDescription : String){
        self.leaugeDescription.text = leaugeDescription
    }


    
}
