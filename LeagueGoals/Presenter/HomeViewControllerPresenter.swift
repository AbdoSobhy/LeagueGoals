//
//  HomeViewControllerPresenter.swift
//  LeagueGoals
//
//  Created by Abdelrahman Sobhy on 7/2/20.
//  Copyright © 2020 Macbook pro. All rights reserved.
//

import Foundation
protocol HomeViewControllerView : AnyObject {
    func navigateToLeaugesDetails(id : String)
    func startLoading()
    func stopLoading()
    func showAlert(title : String , message : String)
    
}
protocol HomeViewControllerPresenter {
    var leaugesCount: Int { get }

    func getLeauges(completionHandler : @escaping ([Leagues])->Void)
    func configure(cell : LeaugeCellView , row : Int)
    func didSelectRowAt(index: Int)

}
class HomeViewControllerPresenterImpl {
    weak var view : HomeViewControllerView?
    
    var leauges = [Leagues]()
    
    
    init(view : HomeViewControllerView) {
        self.view = view
    }
}
extension HomeViewControllerPresenterImpl : HomeViewControllerPresenter {
    
    var leaugesCount: Int {
        leauges.count
    }
    
    func getLeauges(completionHandler: @escaping ([Leagues]) -> Void) {
        view?.startLoading()
        LeagueRequest.leagueRequest(request: LeagueRouter.getLeagues) { [weak self] (leauges : League?) in
            if let leauges = leauges {
                self?.leauges.append(contentsOf: leauges.leagues)
                RealmManger.saveleagues(league: leauges.leagues)
                completionHandler(leauges.leagues)
            }
            else {
                self?.view?.showAlert(title: "Connection", message: "Please Check Your Connection")
                self?.leauges.append(contentsOf: RealmManger.fetchleagues())
                completionHandler(RealmManger.fetchleagues())

            }
            self?.view?.stopLoading()
        }
    }

        // Cell Configure
    func configure(cell : LeaugeCellView , row : Int){
        cell.display(leagueName: self.leauges[row].strLeague)
        cell.display(leagueShortName: self.leauges[row].strLeagueAlternate)
        cell.display(leagueSport: self.leauges[row].strSport)
    }
    func didSelectRowAt(index: Int){
        guard let leagueID = self.leauges[index].idLeague else { return }
        view?.navigateToLeaugesDetails(id: leagueID)
    }
    
}

