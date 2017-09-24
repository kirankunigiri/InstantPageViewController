//
//  InstantPageViewControllerUITests.swift
//  InstantPageViewControllerUITests
//
//  Created by Kiran Kunigiri on 7/13/16.
//  Copyright © 2016 Kiran. All rights reserved.
//

import XCTest

class InstantPageViewControllerUITests: XCTestCase {
    
    var app: XCUIApplication!
        
    override func setUp() {
        super.setUp()
        
        // Put setup code here. This method is called before the invocation of each test method in the class.
        app = XCUIApplication()
        app.launch()
        
        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testSwipe() {
        let persistentLabel = XCUIApplication().staticTexts["This is an item that persists throughout pages"]
        
        persistentLabel.swipeLeft()
        persistentLabel.swipeLeft()
        
        let page3 = app.staticTexts["Page #3"]
        XCTAssertTrue(page3.exists)
        
    }
    
}
