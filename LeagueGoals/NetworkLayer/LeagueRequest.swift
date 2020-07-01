//
//  LeagueRequest.swift
//  LeagueGoals
//
//  Created by Abdelrahman Sobhy on 7/2/20.
//  Copyright © 2020 Macbook pro. All rights reserved.
//

import Foundation
import Alamofire

class LeagueRequest {
    
    static func leagueRequest<T : Codable>(request : LeagueRouter,  completionHandeler: @escaping (T?) -> Void) {
        AF.request(request).responseData { (response : AFDataResponse<Data>) in
            switch response.result{
            case .success(let result):
                do {
                    let obj = try JSONDecoder().decode(T.self, from: result)
                    completionHandeler(obj)
                } catch {
                    completionHandeler(nil)
                }
            case .failure:
                completionHandeler(nil)
            }
        }
    }
    
}
