//
//  ShoppingItemsUITests.swift
//  ShoppingItemsUITests
//
//  Created by Bharatraj Rai on 4/16/20.
//  Copyright © 2020 Bharatraj Rai. All rights reserved.
//

import XCTest

class ShoppingItemsUITests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testCreateNewGarment_WithName() {
        
        let garmentName = "T-Shirt"
        let app = XCUIApplication()
        app.activate()
        
        let addButton = app.navigationBars["Garment List"].buttons["plus.circle"]
        XCTAssertTrue(addButton.exists)
        addButton.tap()
        
        let garmentNameTextFeild = app.textFields["Name"]
        XCTAssertTrue(garmentNameTextFeild.exists)
        garmentNameTextFeild.tap()
        garmentNameTextFeild.typeText(garmentName)
        
        app.navigationBars["Add Garment"].buttons["Save"].tap()
    }
    
    func testWithoutGarmentName_AlertValidation() {
        
        let app = XCUIApplication()
        app.activate()
        app.navigationBars["Garment List"].buttons["plus.circle"].tap()
        app.navigationBars["Add Garment"].buttons["Save"].tap()
        
        let alertDialog = app.alerts["Garment field is empty"]
        XCTAssertTrue(alertDialog.exists)
        alertDialog.buttons["Ok"].tap()
    }

    func testExample() {
        // UI tests must launch the application that they test.
        let app = XCUIApplication()
        app.launch()

        // Use recording to get started writing UI tests.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testLaunchPerformance() {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTOSSignpostMetric.applicationLaunch]) {
                XCUIApplication().launch()
            }
        }
    }
}
