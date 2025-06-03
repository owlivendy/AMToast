import UIKit

final class AMToastWindow: UIWindow {
    static let shared = AMToastWindow(frame: UIScreen.main.bounds)
    private var toastViewController: AMToastViewController?
    
    private override init(frame: CGRect) {
        super.init(frame: frame)
        setupWindow()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupWindow()
    }
    
    private func setupWindow() {
        windowLevel = AMToastConfig.Window.defaultWindowLevel
        backgroundColor = .clear
        isUserInteractionEnabled = false
        isHidden = true
        
        toastViewController = AMToastViewController()
        rootViewController = toastViewController
    }
    
    func addToastViewToQueue(_ toastView: UIView, position: AMToastViewPosition, duration: TimeInterval, delay: TimeInterval) {
        toastViewController?.addToastViewToQueue(toastView, position: position, duration: duration, delay: delay)
    }
    
    func addToastViewToQueue(_ toastView: UIView, position: AMToastViewPosition, duration: TimeInterval) {
        show()
        toastViewController?.addToastViewToQueue(toastView, position: position, duration: duration)
    }
    
    private func show() {
        isHidden = false
    }
    
    func hide() {
        isHidden = true
    }
} 
