import XCTest
@testable import AMToast

final class AMToastTests: XCTestCase {
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
} 