//
//  LeagueDetails.swift
//  LeagueGoals
//
//  Created by Abdelrahman Sobhy on 7/2/20.
//  Copyright © 2020 Macbook pro. All rights reserved.
//

import Foundation
struct LeagueDetails : Codable {
    let leagues : [LeagueData]
}
struct LeagueData : Codable {
    
    let strLeague : String?
    let strSport : String?
    let strCountry : String?
    let strLogo : String?
    let strDescriptionEN : String?
    
}
