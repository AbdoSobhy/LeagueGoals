//
//  HomeViewController.swift
//  LeagueGoals
//
//  Created by Abdelrahman Sobhy on 7/1/20.
//  Copyright © 2020 Macbook pro. All rights reserved.
//

import UIKit
import NVActivityIndicatorView

class HomeViewController: UIViewController, NVActivityIndicatorViewable {
    @IBOutlet weak private var leaugeTableView: UITableView!
    var homeViewControllerPresenter : HomeViewControllerPresenter?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        homeViewControllerPresenter = HomeViewControllerPresenterImpl(view : self)
        homeViewControllerPresenter?.getLeauges(completionHandler: { [weak self] (leagues) in
            if !leagues.isEmpty {
                self?.leaugeTableView.reloadData()
            }
        })
    }
    
}

extension HomeViewController : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.homeViewControllerPresenter?.leaugesCount ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "LeaugeTableViewCell") as? LeaugeTableViewCell else { return UITableViewCell() }
        self.homeViewControllerPresenter?.configure(cell: cell, row: indexPath.row)
        return cell
    }
    
}
extension HomeViewController : UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.homeViewControllerPresenter?.didSelectRowAt(index: indexPath.row)
    }
}
extension HomeViewController : HomeViewControllerView {
    func showAlert(title : String , message : String) {
        let alert = UIAlertController(title: title , message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default) { [weak self] _ in
            self?.dismiss(animated: true, completion: nil)}
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
    func startLoading() {
        self.startAnimating()
    }
    
    func stopLoading() {
        self.stopAnimating()
    }
    
    func navigateToLeaugesDetails(id: String) {
        guard let detailsViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "DetailsViewController") as? DetailsViewController else {return}
        detailsViewController.leaugeId = id
        present(detailsViewController,animated: true,completion: nil)
    }
    
    
}

