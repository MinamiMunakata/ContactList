//
//  ContactListUITests.swift
//  ContactListUITests
//
//  Created by minami on 2018-10-30.
//  Copyright © 2018 宗像三奈美. All rights reserved.
//

import XCTest

class ContactListUITests: XCTestCase {
  
  var app: XCUIApplication!
  
  
  override func setUp() {
    // Put setup code here. This method is called before the invocation of each test method in the class.
    
    // In UI tests it is usually best to stop immediately when a failure occurs.
    continueAfterFailure = false
    
    // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
    app = XCUIApplication()
    XCUIApplication().launch()
    
    // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
  }

  
  func testNavigation() {
    // check the nav title
    // tableViewCell and tap
    // check the nav title (exists)
    
//    let app = XCUIApplication() // Proxy application
    // XCUIElement
//    app.navigationBars["List"].tap()

    // tap on the cell
    app.tables/*@START_MENU_TOKEN@*/.cells.staticTexts["Minami"]/*[[".cells.staticTexts[\"Minami\"]",".staticTexts[\"Minami\"]"],[[[-1,1],[-1,0]]],[1]]@END_MENU_TOKEN@*/.tap()
    
    let detailNavigationBar = app.navigationBars["Detail"]
    XCTAssert(detailNavigationBar.exists, "Sgue properly not working from tapping on the cell")
    // if 'detailNavigationBar.exists' is true, it's green.
    // if 'detailNavigationBar.exists' is false, show error message you set.
    
    // -----------
    
  }
  
  func testGiada() {
    // tap on Giada cell
    app.tables/*@START_MENU_TOKEN@*/.cells.staticTexts["Giada"]/*[[".cells.staticTexts[\"Giada\"]",".staticTexts[\"Giada\"]"],[[[-1,1],[-1,0]]],[1]]@END_MENU_TOKEN@*/.tap()
    
    // tap on anything with Giada
    let giada = app.staticTexts.matching(identifier: "name").firstMatch // Query
    XCTAssert(giada.label == "Giada", "Data not showing correctly.")
    
  }
  
}
