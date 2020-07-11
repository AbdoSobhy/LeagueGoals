//
//  RealmManger.swift
//  LeagueGoals
//
//  Created by Abdelrahman Sobhy on 7/3/20.
//  Copyright © 2020 Macbook pro. All rights reserved.
//

import Foundation
import RealmSwift

class RealmManger{
    fileprivate init(){ }
    
    private static let realm = try! Realm()

    
    static func saveleagues(league: [Leagues]){
        try! realm.write {
            realm.add(league,update: .modified)
        }
    }
    
    static func fetchleagues()-> [Leagues]{
        let leagues = realm.objects(Leagues.self)
        var leaguesArray = [Leagues]()
        for League in leagues {
            leaguesArray.append(League)
        }
        return leaguesArray
    }
}
