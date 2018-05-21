//
//  VelkeiMiklosNYTMPUITests.swift
//  VelkeiMiklosNYTMPUITests
//
//  Created by Velkei Miklós on 2018. 05. 19..
//  Copyright © 2018. NeonatCore. All rights reserved.
//

import XCTest
class VelkeiMiklosNYTMPUITests: XCTestCase {
    
    var app: XCUIApplication!
    
    override func setUp() {
        super.setUp()
        continueAfterFailure = false
        app = XCUIApplication()
    }
    
    override func tearDown() {
        app = nil
        super.tearDown()
    }
    
    func test_Segmented_Controls(){
        app.launch()
        app.buttons[Period.WEEK].tap()
        XCTAssertTrue(app.segmentedControls.buttons.element(boundBy: 1).isSelected)
        app.buttons[Period.DAY].tap()
        XCTAssertTrue(app.segmentedControls.buttons.element(boundBy: 0).isSelected)
        app.buttons[Period.MONTH].tap()
        XCTAssertTrue(app.segmentedControls.buttons.element(boundBy: 2).isSelected)
    }

    func test_TableView_Is_Not_Empty(){
        app.launch()
        XCUIApplication().tables.element.swipeUp()
        XCTAssert(app.tables.staticTexts.count > 0)
    }
    
    func test_TableView_Tap_On_Cell_And_Show_Detail(){
        app.launch()
        XCUIApplication().tables.cells.element(boundBy: 1).tap()
        XCTAssertTrue(app.isDisplayingDetailVC)
    }
    
    func test_Tap_On_DetailVC_Back_Button(){
      app.launch()
      XCUIApplication().tables.cells.element(boundBy: 1).tap()
      app.navigationBars.buttons[ButtonText.BACK].tap()
      XCTAssertTrue(app.isDisplayingMainVC)
    }
    
    func test_Tap_On_Safari_Button(){
        app.launch()
        XCUIApplication().tables.cells.element(boundBy: 1).tap()
        app.buttons[ButtonText.OPEN].tap()
        XCTAssertFalse(app.isDisplayingDetailVC)
    }
}

extension XCUIApplication{
    var isDisplayingDetailVC: Bool{
        return otherElements[View_ID.VIEW_ID_DETAIL_VC].exists
    }
    var isDisplayingMainVC: Bool{
        return otherElements[View_ID.VIEW_ID_MAIN_VC].exists
    }
}
