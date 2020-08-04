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
        // Given
        let expectation = self.expectation(description: "leagues")
        var leagues : [Leagues]?
        // When
        LeagueRequest.leagueRequest(request: LeagueRouter.getLeagues) { (results : League?) in
            if let results = results  {
                leagues = results.leagues
            }
            expectation.fulfill()
        }
        
        waitForExpectations(timeout: 5, handler: nil)
        // After
        XCTAssertNotNil(leagues,"failed to load table view")
    }
    func testDetailsLeauge() {
        // Given
        let expectation  = self.expectation(description: "detailedLeauge")
        let id = "4328"
        var leaugeDetailed : [LeagueData]?
        // When
        LeagueRequest.leagueRequest(request: LeagueRouter.leaguesDetails(id: id)) { (leauge : LeagueDetails?) in
            if let leauge = leauge {
                leaugeDetailed = leauge.leagues
            }
            expectation.fulfill()
        }
        waitForExpectations(timeout: 5)
        // After
        XCTAssertNotNil(leaugeDetailed,"failed to load details")

    }
    
}
