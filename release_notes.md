# AMToast 0.2.2

## 新增功能
- 添加 Swift Package Manager 支持
- 优化项目结构，提升代码组织性
- 添加基础单元测试

## 改进
- 重构项目目录结构，使其同时支持 CocoaPods 和 SPM
- 优化资源文件管理
- 更新文档，添加 SPM 安装说明

## 安装方式

### Swift Package Manager
在 Xcode 中，选择 File > Swift Packages > Add Package Dependency，然后输入：
```
https://github.com/owlivendy/AMToast.git
```

或在 Package.swift 中添加：
```swift
dependencies: [
    .package(url: "https://github.com/owlivendy/AMToast.git", from: "0.2.2")
]
```

### CocoaPods
在 Podfile 中添加：
```ruby
pod 'AMToast', '~> 0.2.2'
``` 