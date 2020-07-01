//
//  League.swift
//  LeagueGoals
//
//  Created by Abdelrahman Sobhy on 7/2/20.
//  Copyright © 2020 Macbook pro. All rights reserved.
//

import Foundation

struct League : Codable {
    let leagues : [Leagues]
}

struct Leagues : Codable {
    let idLeague : String?
    let strLeague : String?
    let strSport : String?
    let strLeagueAlternate : String?
}
