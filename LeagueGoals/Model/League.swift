//
//  League.swift
//  LeagueGoals
//
//  Created by Abdelrahman Sobhy on 7/2/20.
//  Copyright © 2020 Macbook pro. All rights reserved.
//

import Foundation
import RealmSwift

struct League : Codable {
    let leagues : [Leagues]
}

class Leagues : Object,Codable {
    @objc dynamic var idLeague : String? = nil
    @objc dynamic var strLeague : String? = nil
    @objc dynamic var strSport : String? = nil
    @objc dynamic var strLeagueAlternate : String? = nil
    
    override static func primaryKey() -> String? {
        return "idLeague"
    }

}


