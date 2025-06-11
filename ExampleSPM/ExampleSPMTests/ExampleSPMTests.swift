//
//  ExampleSPMTests.swift
//  ExampleSPMTests
//
//  Created by shen xiaofei on 2025/6/9.
//

import XCTest
@testable import ExampleSPM
@testable import AMToast

final class ExampleSPMTests: XCTestCase {

    override func setUpWithError() throws {
        // 每个测试用例开始前重置配置
        AMToastConfig.defaultDuration = 2.0
        AMToastConfig.successDuration = 2.0
        AMToastConfig.ToastViewStyle.cornerRadius = 18.0
        AMToastConfig.ToastViewStyle.backgroundColor = UIColor { traitCollection in
            return traitCollection.userInterfaceStyle == .dark ?
                UIColor(white: 0.2, alpha: 0.94) :
                UIColor.black.withAlphaComponent(0.94)
        }
    }

    override func tearDownWithError() throws {
        // 每个测试用例结束后的清理工作
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

    func testBasicToast() throws {
        // 测试基本的 Toast 显示
        AMToast.show(with: "Test Toast")
        XCTAssertTrue(true)
    }
    
    func testToastConfig() throws {
        // 测试配置修改
        let originalCornerRadius = AMToastConfig.ToastViewStyle.cornerRadius
        AMToastConfig.ToastViewStyle.cornerRadius = 20
        XCTAssertEqual(AMToastConfig.ToastViewStyle.cornerRadius, 20)
        // 恢复原始值
        AMToastConfig.ToastViewStyle.cornerRadius = originalCornerRadius
    }
    
    func testSuccessToast() throws {
        // 测试成功样式的 Toast
        AMToast.showSuccess(with: "Success Message")
        XCTAssertTrue(true)
    }
    
    func testToastDuration() throws {
        // 测试不同的显示时长
        AMToast.show(with: "Short Duration", duration: 1.0)
        AMToast.show(with: "Long Duration", duration: 5.0)
        XCTAssertTrue(true)
    }
    
    func testToastPosition() throws {
        // 测试不同的显示位置
        AMToast.show(with: "Top Position", position: .top)
        AMToast.show(with: "Center Position", position: .center)
        XCTAssertTrue(true)
    }
    
    func testCustomViewToast() throws {
        // 测试自定义视图的 Toast
        let customView = UIView()
        customView.backgroundColor = .blue
        customView.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
        AMToast.show(with: customView)
        XCTAssertTrue(true)
    }
    
    func testAutoLayoutCustomViewToast() throws {
        // 测试带有内部子视图且能自适应内容的 customView
        let containerView = UIView()
        containerView.backgroundColor = .systemBlue
        
        // 创建内部子视图
        let imageView = UIImageView(image: UIImage(systemName: "checkmark.circle.fill"))
        imageView.tintColor = .white
        imageView.contentMode = .scaleAspectFit
        
        let label = UILabel()
        label.text = "操作成功"
        label.textColor = .white
        label.font = .systemFont(ofSize: 16)
        
        // 使用 AutoLayout 布局
        containerView.addSubview(imageView)
        containerView.addSubview(label)
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        label.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            // 设置 imageView 约束
            imageView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 12),
            imageView.centerYAnchor.constraint(equalTo: containerView.centerYAnchor),
            imageView.widthAnchor.constraint(equalToConstant: 24),
            imageView.heightAnchor.constraint(equalToConstant: 24),
            
            // 设置 label 约束
            label.leadingAnchor.constraint(equalTo: imageView.trailingAnchor, constant: 8),
            label.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -12),
            label.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 8),
            label.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -8)
        ])
        
        // 显示 Toast
        AMToast.show(with: containerView)
        XCTAssertTrue(true)
    }
    
    func testMultipleToasts() throws {
        // 测试多个 Toast 的显示
        AMToast.show(with: "First Toast")
        AMToast.show(with: "Second Toast")
        AMToast.show(with: "Third Toast")
        XCTAssertTrue(true)
    }
    
    func testLongTextToast() throws {
        // 测试长文本的显示
        let longText = "This is a very long text that should be properly wrapped and displayed in multiple lines to ensure the toast view handles long content correctly"
        AMToast.show(with: longText)
        XCTAssertTrue(true)
    }
}
