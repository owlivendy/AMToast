//
//  AMToastConfig.swift
//  AMToast
//
//  Created by shen xiaofei on 2025/6/3.
//

import UIKit

public struct AMToastConfig {
    public static var defaultDuration = 2.0
    public static var successDuration = 2.0
    
    //toastview style default
    public struct ToastViewStyle {
        public static var cornerRadius = 18.0
        
        // 背景颜色配置
        public struct BackgroundColor {
            public static var light = UIColor.black.withAlphaComponent(0.94)
            public static var dark = UIColor(white: 0.2, alpha: 0.94)
            
            public static var current: UIColor {
                if #available(iOS 13.0, *) {
                    return UITraitCollection.current.userInterfaceStyle == .dark ? dark : light
                }
                return light
            }
        }
        
        // 文字颜色配置
        public struct TextColor {
            public static var light = UIColor.white
            public static var dark = UIColor.white
            
            public static var current: UIColor {
                if #available(iOS 13.0, *) {
                    return UITraitCollection.current.userInterfaceStyle == .dark ? dark : light
                }
                return light
            }
        }
        
        // 字体配置
        public struct Font {
            public static var light = UIFont.systemFont(ofSize: 14)
            public static var dark = UIFont.systemFont(ofSize: 14)
            
            public static var current: UIFont {
                if #available(iOS 13.0, *) {
                    return UITraitCollection.current.userInterfaceStyle == .dark ? dark : light
                }
                return light
            }
        }
    }
    
    public struct Window {
        public static var defaultWindowLevel = UIWindow.Level.statusBar - 1 {
            didSet {
                AMToastWindow.shared.windowLevel = defaultWindowLevel
            }
        }
    }
    
    public struct Position {
        public static var topMarginPortrait: CGFloat = 60.0
        public static var topMarginLandscape: CGFloat = 20.0
    }
    
    // 重置所有配置为默认值
    public static func resetToDefault() {
        defaultDuration = 2.0
        successDuration = 2.0
        ToastViewStyle.cornerRadius = 18.0
        ToastViewStyle.BackgroundColor.light = UIColor.black.withAlphaComponent(0.94)
        ToastViewStyle.BackgroundColor.dark = UIColor(white: 0.2, alpha: 0.94)
        ToastViewStyle.TextColor.light = UIColor.white
        ToastViewStyle.TextColor.dark = UIColor.white
        ToastViewStyle.Font.light = UIFont.systemFont(ofSize: 14)
        ToastViewStyle.Font.dark = UIFont.systemFont(ofSize: 14)
        Window.defaultWindowLevel = UIWindow.Level.statusBar - 1
        Position.topMarginPortrait = 60.0
        Position.topMarginLandscape = 20.0
    }
}
