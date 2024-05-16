//
//  SafariOpenerUITests.swift
//  SafariOpenerUITests
//
//  Created by Jordan Carter on 16/05/2024.
//
import XCTest

class SafariOpenerUITests: XCTestCase {
    override func setUpWithError() throws {
        continueAfterFailure = false
        XCUIApplication().launch()
    }

    func testOpenSafari() throws {
        let app = XCUIApplication()
        app.buttons["Open Safari"].tap()
        
        // Wait for a short duration to give Safari time to open
        sleep(3)
        
        // Attempt to verify that Safari is the frontmost app
        let safari = XCUIApplication(bundleIdentifier: "com.apple.mobilesafari")
        XCTAssertTrue(safari.waitForExistence(timeout: 10))
    }
}
