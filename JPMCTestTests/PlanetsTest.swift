//
//  PlanetsTest.swift
//  JPMCTestTests
//
//  Created by Atul Prakash on 24/05/23.
//

import Foundation
import XCTest
import SwiftUI

@testable import JPMCTest
class PlanetsTest: XCTestCase {
    
    override class func setUp() {
        
    }
    
    override class func tearDown() {
        
    }

    func testSuccessfulAPI() {
        let viewModel = PlanetsViewModel()
        XCTAssertEqual(viewModel.planets.count, 0, "Planet initial count is non zero")
        
        let expectation = expectation(description: "Fetch Planets")
        viewModel.getPlanets()
        DispatchQueue.main.asyncAfter(deadline: .now() + 10) {
            expectation.fulfill()
        }
        waitForExpectations(timeout: 10)
        
        XCTAssertNotEqual(viewModel.planets.count, 0, "Planet count is still zero post api call")
    }
    
    func testUnsuccessfulAPI() {
        let viewModel = PlanetsViewModel()
        XCTAssertEqual(viewModel.planets.count, 0, "Planet initial count is non zero")
        
        let expectation = expectation(description: "Fetch Planets")
        viewModel.getPlanets(url: "")
        DispatchQueue.main.asyncAfter(deadline: .now() + 10) {
            expectation.fulfill()
        }
        waitForExpectations(timeout: 10)
        
        XCTAssertEqual(viewModel.planets.count, 0, "Planet count is non zero post wrong api call")
    }
    
    func testOffline() {
        let viewModel = PlanetsViewModel()
        XCTAssertEqual(viewModel.planets.count, 0, "Planet initial count is non zero")
        viewModel.getPlanets(connected: false)
        XCTAssertEqual(viewModel.planets.count, 0, "Planet count is Post Data Base")
    }
}
