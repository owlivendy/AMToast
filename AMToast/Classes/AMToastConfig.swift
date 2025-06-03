//
//  AMToastConfig.swift
//  AMToast
//
//  Created by shen xiaofei on 2025/6/3.
//

public struct AMToastConfig {
    public static var defaultDuration = 2.0
    public static var successDuration = 2.0
    //toastview style default
    public struct ToastViewStyle {
        public static var cornerRadius = 18.0
        public static var backgroundColor = UIColor.black.withAlphaComponent(0.94)
    }
    public struct Window {
        public static var defaultWindowLevel = UIWindow.Level.statusBar - 1 {
            didSet {
                AMToastWindow.shared.windowLevel = defaultWindowLevel
            }
        }
    }
}
