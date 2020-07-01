//
//  LeagueRouter.swift
//  LeagueGoals
//
//  Created by Abdelrahman Sobhy on 7/2/20.
//  Copyright © 2020 Macbook pro. All rights reserved.
//

import Foundation
import Alamofire

enum LeagueRouter: URLRequestConvertible {
    
    case getLeagues
    case leaguesDetails(id: String)
    
    var url : URL {
        switch self {
        case .getLeagues:
            return URL(string: "https://www.thesportsdb.com/api/v1/json/1/all_leagues.php")!
        case .leaguesDetails:
            return URL(string: "https://www.thesportsdb.com/api/v1/json/1/lookupleague.php")!
        }
    }
    
    var method : HTTPMethod {
        switch self {
        case .getLeagues:
            return .get
        case . leaguesDetails:
            return .get
        }
    }
    
    var parameters : [String:Any]{
        switch self {
        case .leaguesDetails(let id):
            return ["id": id ]
        default:
            return [:]
        }
    }
    
    func asURLRequest() throws -> URLRequest {
        var urlRequest = URLRequest(url: url)
        urlRequest.method = method
        return try URLEncoding.default.encode(urlRequest, with: parameters)
   
    }
}
