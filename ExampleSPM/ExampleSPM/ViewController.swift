import UIKit
import AMToast

class ViewController: UIViewController {
    
    private let stackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 20
        stack.alignment = .center
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        
        // 自动显示测试用的 Toast
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            // 显示基本 Toast
            AMToast.show(with: "Test Toast")
            
            // 显示成功 Toast
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                AMToast.showSuccess(with: "Success Message")
            }
            
            // 显示多个 Toast
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                AMToast.show(with: "First Toast")
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                    AMToast.show(with: "Second Toast")
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                        AMToast.show(with: "Third Toast")
                    }
                }
            }
            
            // 显示自定义视图 Toast
            DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                let customView = UIView()
                customView.backgroundColor = .blue
                customView.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
                customView.accessibilityIdentifier = "Custom View"
                AMToast.show(with: customView)
            }
        }
    }
    
    private func setupUI() {
        view.backgroundColor = .white
        view.addSubview(stackView)
        
        NSLayoutConstraint.activate([
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
        
        // 添加测试按钮
        addButton(title: "显示普通提示", action: #selector(showNormalToast))
        addButton(title: "显示成功提示", action: #selector(showSuccessToast))
//        addButton(title: "显示错误提示", action: #selector(showErrorToast))
        addButton(title: "显示顶部提示", action: #selector(showTopToast))
        addButton(title: "显示自定义样式", action: #selector(showCustomStyleToast))
    }
    
    private func addButton(title: String, action: Selector) {
        let button = UIButton(type: .system)
        button.setTitle(title, for: .normal)
        button.addTarget(self, action: action, for: .touchUpInside)
        stackView.addArrangedSubview(button)
    }
    
    @objc private func showNormalToast() {
        AMToast.show(with: "这是一条普通提示")
    }
    
    @objc private func showSuccessToast() {
        AMToast.showSuccess(with: "操作成功！")
    }
    
//    @objc private func showErrorToast() {
//        AMToast.showError(with: "操作失败！")
//    }
    
    @objc private func showTopToast() {
        AMToast.show(with: "这是一条顶部提示", position: .top)
    }
    
    @objc private func showCustomStyleToast() {
        // 保存原始配置
        let originalCornerRadius = AMToastConfig.ToastViewStyle.cornerRadius
        let originalBackgroundColor = AMToastConfig.ToastViewStyle.backgroundColor
        
        // 设置自定义样式
        AMToastConfig.ToastViewStyle.cornerRadius = 20
        AMToastConfig.ToastViewStyle.backgroundColor = .systemBlue
        
        // 显示提示
        AMToast.show(with: "自定义样式提示")
        
        // 恢复原始配置
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.5) {
            AMToastConfig.ToastViewStyle.cornerRadius = originalCornerRadius
            AMToastConfig.ToastViewStyle.backgroundColor = originalBackgroundColor
        }
    }
} 
