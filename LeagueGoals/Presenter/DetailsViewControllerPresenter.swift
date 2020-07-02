//
//  DetailsViewControllerPresenter.swift
//  LeagueGoals
//
//  Created by Abdelrahman Sobhy on 7/2/20.
//  Copyright © 2020 Macbook pro. All rights reserved.
//

import Foundation
protocol DetailsViewControllerView : AnyObject {
    var leaugeId : String? { get }
    func display(leaugeLogo : String )
    func display(leaugeName : String)
    func display(leaugeSport : String)
    func display(leaugeCountry : String)
    func display(leaugeDescription : String)
    func startLoading()
    func stopLoading()

}
protocol DetailsViewControllerPresenter {
    func getLeaugeDetails(completionHandler : @escaping (LeagueDetails)->Void)
}
class DetailsViewControllerPresenterImpl {
    weak var view : DetailsViewControllerView?
    
    init(view : DetailsViewControllerView) {
        self.view = view
    }
}
extension DetailsViewControllerPresenterImpl : DetailsViewControllerPresenter {
    
    func getLeaugeDetails(completionHandler: @escaping (LeagueDetails) -> Void) {
        guard let id = view?.leaugeId else {return}
        view?.startLoading()
        LeagueRequest.leagueRequest(request: LeagueRouter.leaguesDetails(id: id)) { [weak self] (details : LeagueDetails?) in
            if details != nil {
                self?.view?.display(leaugeLogo: details?.leagues[0].strLogo ?? " ")
                self?.view?.display(leaugeName: details?.leagues[0].strLeague ?? " ")
                self?.view?.display(leaugeSport: details?.leagues[0].strSport ?? " ")
                self?.view?.display(leaugeCountry: details?.leagues[0].strCountry ?? " ")
                self?.view?.display(leaugeDescription: details?.leagues[0].strDescriptionEN ?? " ")
            }
            self?.view?.stopLoading()
        }
    }
    
    
}
