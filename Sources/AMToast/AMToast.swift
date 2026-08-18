import UIKit

public enum AMToastViewPosition {
    case top
    case center
}

public final class AMToast {
    
    public static func show(with message: String, duration: TimeInterval = AMToastConfig.defaultDuration, position: AMToastViewPosition = .center) {
        let textView = AMTextToastView(message: message)
        AMToastWindow.shared.addToastViewToQueue(textView, position: position, duration: duration)
    }
    
    public static func show(with customView: UIView, duration: TimeInterval = AMToastConfig.defaultDuration, position: AMToastViewPosition = .center) {
        let toastView = AMToastView()
        toastView.customView = customView
        AMToastWindow.shared.addToastViewToQueue(toastView, position: position, duration: duration)
    }
    
    public static func showSuccess(with message: String, duration: TimeInterval = AMToastConfig.successDuration, position: AMToastViewPosition = .center) {
        let successView = AMSuccessToastView(message: message)
        AMToastWindow.shared.addToastViewToQueue(successView, position: position, duration: duration)
    }
    
    public static func showError(with message: String, duration: TimeInterval = AMToastConfig.errorDuration, position: AMToastViewPosition = .center) {
        let errorView = AMErrorToastView(message: message)
        AMToastWindow.shared.addToastViewToQueue(errorView, position: position, duration: duration)
    }
} 
