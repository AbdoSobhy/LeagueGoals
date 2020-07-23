//
//  LeagueGoalsTests.swift
//  LeagueGoalsTests
//
//  Created by Abdelrahman Sobhy on 7/23/20.
//  Copyright © 2020 Macbook pro. All rights reserved.
//

import XCTest
@testable import LeagueGoals

class LeagueGoalsTests: XCTestCase {
    
    func testGetAllLeagues() {
        let expectation = self.expectation(description: "leagues")
        
        var leagues : [Leagues]?
        LeagueRequest.leagueRequest(request: LeagueRouter.getLeagues) { (results : League?) in
            if let results = results  {
                leagues = results.leagues
            }
            expectation.fulfill()
        }
        
        waitForExpectations(timeout: 10, handler: nil)
        
        XCTAssertNotNil(leagues,"failed to load table view")
    }
    func testDetailsLeauge() {
        let expectation  = self.expectation(description: "detailed leauge")
        let id = "4328"
        var leaugeDetailed : [LeagueData]?
        LeagueRequest.leagueRequest(request: LeagueRouter.leaguesDetails(id: id)) { (leauge : LeagueDetails?) in
            if let leauge = leauge {
                leaugeDetailed = leauge.leagues
            }
            expectation.fulfill()
        }
        waitForExpectations(timeout: 10, handler: nil)
        XCTAssertNotNil(leaugeDetailed,"failed to load details")

    }
    
}
