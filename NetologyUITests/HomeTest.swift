//
//  Untitled.swift
//  Netology
//
//  Created by Григорий Кайгородцев on 14.10.2024.
//
import XCTest

class HomeTest: XCTestCase {

    func testLogin() throws {
        let app = XCUIApplication()
        app.launch()

        let username = "Admin"
        let password = "qwerty"

        let loginTextField = app.textFields["login"]
        loginTextField.tap()
        loginTextField.typeText(username)

        let passwordTextField = app.textFields["Password"]
        passwordTextField.tap()
        passwordTextField.typeText(password)
        
        app.buttons["login"].tap()
        
        //let loginButton = app.buttons["login"]
        //XCTAssertTrue(loginButton.isEnabled)
        //loginButton.tap()
        _ = app.staticTexts["user_login"]
        let predicate = NSPredicate(format: "label CONTAINS[c] %@", username)
        let login = app.staticTexts.containing(predicate)
        XCTAssertNotNil(login)

        let fullScreenshot = XCUIScreen.main.screenshot()
        let screenshot = XCTAttachment(screenshot: fullScreenshot)
        screenshot.lifetime = .keepAlways
        add(screenshot)
    }
}
 
