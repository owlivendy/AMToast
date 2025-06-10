//
//  ExampleSPMUITests.swift
//  ExampleSPMUITests
//
//  Created by shen xiaofei on 2025/6/9.
//

import XCTest

final class ExampleSPMUITests: XCTestCase {

    override func setUpWithError() throws {
        // 在 UI 测试中，最好在失败时立即停止
        continueAfterFailure = false
    }

    override func tearDownWithError() throws {
        // 每个测试用例结束后的清理工作
    }

    @MainActor
    func testBasicToast() throws {
        // 启动应用
        let app = XCUIApplication()
        app.launch()
        
        // 等待 Toast 显示
        let toast = app.staticTexts["Test Toast"]
        XCTAssertTrue(toast.waitForExistence(timeout: 2))
    }
    
    @MainActor
    func testSuccessToast() throws {
        // 启动应用
        let app = XCUIApplication()
        app.launch()
        
        // 等待成功 Toast 显示
        let toast = app.staticTexts["Success Message"]
        XCTAssertTrue(toast.waitForExistence(timeout: 2))
    }
    
    @MainActor
    func testMultipleToasts() throws {
        // 启动应用
        let app = XCUIApplication()
        app.launch()
        
        // 检查多个 Toast 的显示
        let firstToast = app.staticTexts["First Toast"]
        let secondToast = app.staticTexts["Second Toast"]
        let thirdToast = app.staticTexts["Third Toast"]
        
        XCTAssertTrue(firstToast.waitForExistence(timeout: 2))
        XCTAssertTrue(secondToast.waitForExistence(timeout: 2))
        XCTAssertTrue(thirdToast.waitForExistence(timeout: 2))
    }
    
    @MainActor
    func testCustomViewToast() throws {
        // 启动应用
        let app = XCUIApplication()
        app.launch()
        
        // 检查自定义视图的 Toast
        let customView = app.otherElements["Custom View"]
        XCTAssertTrue(customView.waitForExistence(timeout: 2))
    }
}
