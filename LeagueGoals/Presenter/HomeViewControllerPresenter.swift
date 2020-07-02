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
    var leaugesCount: Int { get }

    func configure(cell : LeaugeCellView , row : Int)
    func getLeauges(completionHandler : @escaping ([Leagues])->Void)

}
class HomeViewControllerPresenterImpl {
    weak var view : HomeViewControllelrView?
    
    var leauges = [Leagues]()
    
    
    init(view : HomeViewControllelrView) {
        self.view = view
    }
}
extension HomeViewControllerPresenterImpl : HomeViewControllerPresenter {
    
    var leaugesCount: Int {
        leauges.count
    }
    
    func getLeauges(completionHandler: @escaping ([Leagues]) -> Void) {
        LeagueRequest.leagueRequest(request: LeagueRouter.getLeagues) { (leauges : League?) in
            if let leauges = leauges {
                self.leauges.append(contentsOf: leauges.leagues)
                completionHandler(leauges.leagues)
            }
            else {
                // show error to user
            }
        }
    }

        // Cell Configure
    func configure(cell : LeaugeCellView , row : Int){
        cell.display(leagueName: self.leauges[row].strLeague ?? "")
        cell.display(leagueShortName: self.leauges[row].strLeagueAlternate ?? "")
        cell.display(leagueSport: self.leauges[row].strSport ?? "")
    }
    
}

