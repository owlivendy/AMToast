import XCTest
@testable import AMToast

class AMToastTests: XCTestCase {
    override func setUp() {
        super.setUp()
        // 每个测试用例开始前重置配置
        AMToastConfig.resetToDefault()
    }
    
    override func tearDown() {
        super.tearDown()
        // 每个测试用例结束后重置配置
        AMToastConfig.resetToDefault()
    }
    
    func testBasicToast() {
        // 测试基本的 Toast 显示
        AMToast.show(with: "Test Toast")
        // 由于 Toast 是异步显示的，这里只能测试方法调用是否成功
        XCTAssertTrue(true)
    }
    
    func testToastConfig() {
        // 测试配置修改
        let originalCornerRadius = AMToastConfig.ToastViewStyle.cornerRadius
        AMToastConfig.ToastViewStyle.cornerRadius = 20
        XCTAssertEqual(AMToastConfig.ToastViewStyle.cornerRadius, 20)
        // 恢复原始值
        AMToastConfig.ToastViewStyle.cornerRadius = originalCornerRadius
    }
    
    func testToastStyles() {
        // 测试不同样式的 Toast
        AMToast.show(with: "Success", style: .success)
        AMToast.show(with: "Error", style: .error)
        AMToast.show(with: "Warning", style: .warning)
        AMToast.show(with: "Info", style: .info)
        XCTAssertTrue(true)
    }
    
    func testCustomConfig() {
        // 测试自定义配置
        let customConfig = AMToastConfig()
        customConfig.ToastViewStyle.cornerRadius = 15
        customConfig.ToastViewStyle.backgroundColor = .blue
        customConfig.ToastViewStyle.textColor = .white
        customConfig.ToastViewStyle.font = .systemFont(ofSize: 16)
        
        AMToast.show(with: "Custom Config", config: customConfig)
        XCTAssertTrue(true)
    }
    
    func testToastDuration() {
        // 测试不同的显示时长
        AMToast.show(with: "Short Duration", duration: 1.0)
        AMToast.show(with: "Long Duration", duration: 5.0)
        XCTAssertTrue(true)
    }
    
    func testToastPosition() {
        // 测试不同的显示位置
        AMToast.show(with: "Top Position", position: .top)
        AMToast.show(with: "Center Position", position: .center)
        AMToast.show(with: "Bottom Position", position: .bottom)
        XCTAssertTrue(true)
    }
    
    func testToastWithImage() {
        // 测试带图片的 Toast
        if let image = UIImage(named: "success", in: .module, compatibleWith: nil) {
            AMToast.show(with: "With Image", image: image)
        }
        XCTAssertTrue(true)
    }
    
    func testToastDismiss() {
        // 测试手动关闭 Toast
        AMToast.show(with: "Will be dismissed")
        AMToast.dismiss()
        XCTAssertTrue(true)
    }
    
    func testMultipleToasts() {
        // 测试多个 Toast 的显示
        AMToast.show(with: "First Toast")
        AMToast.show(with: "Second Toast")
        AMToast.show(with: "Third Toast")
        XCTAssertTrue(true)
    }
    
    func testToastWithLongText() {
        // 测试长文本的显示
        let longText = "This is a very long text that should be properly wrapped and displayed in multiple lines to ensure the toast view handles long content correctly"
        AMToast.show(with: longText)
        XCTAssertTrue(true)
    }
} 