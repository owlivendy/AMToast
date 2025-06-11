import UIKit
import AMToast

class ViewController: UIViewController {
    
    private let tableView = UITableView(frame: .zero, style: .grouped)
    private let sections: [Section] = [
        Section(title: "基础用法", examples: [
            ("显示普通提示", {
                AMToast.show(with: "这是一条普通提示")
            }),
            ("显示顶部提示", {
                AMToast.show(with: "这是一条顶部提示", position: .top)
            }),
            ("显示成功提示", {
                AMToast.showSuccess(with: "操作成功！")
            })
        ]),
        Section(title: "样式配置", examples: [
            ("显示当前圆角值", {
                AMToast.show(with: "当前圆角值: \(AMToastConfig.ToastViewStyle.cornerRadius)", position: .center)
            }),
            ("修改圆角为20", {
                AMToastConfig.ToastViewStyle.cornerRadius = 20
                AMToast.show(with: "已将圆角修改为20", position: .center)
            }),
            ("修改圆角为5", {
                AMToastConfig.ToastViewStyle.cornerRadius = 5
                AMToast.show(with: "已将圆角修改为5", position: .center)
            }),
            ("修改浅色模式背景色为红色", {
                AMToastConfig.ToastViewStyle.BackgroundColor.light = UIColor.red.withAlphaComponent(0.94)
                AMToast.show(with: "已将浅色模式背景色修改为红色", position: .center)
            }),
            ("修改深色模式背景色为蓝色", {
                AMToastConfig.ToastViewStyle.BackgroundColor.dark = UIColor.blue.withAlphaComponent(0.94)
                AMToast.show(with: "已将深色模式背景色修改为蓝色", position: .center)
            }),
            ("修改字体大小为16", {
                AMToastConfig.ToastViewStyle.Font.light = UIFont.systemFont(ofSize: 16)
                AMToastConfig.ToastViewStyle.Font.dark = UIFont.systemFont(ofSize: 16)
                AMToast.show(with: "已将字体大小修改为16", position: .center)
            }),
            ("修改字体大小为12", {
                AMToastConfig.ToastViewStyle.Font.light = UIFont.systemFont(ofSize: 12)
                AMToastConfig.ToastViewStyle.Font.dark = UIFont.systemFont(ofSize: 12)
                AMToast.show(with: "已将字体大小修改为12", position: .center)
            }),
            ("使用粗体字体", {
                AMToastConfig.ToastViewStyle.Font.light = UIFont.boldSystemFont(ofSize: 14)
                AMToastConfig.ToastViewStyle.Font.dark = UIFont.boldSystemFont(ofSize: 14)
                AMToast.show(with: "已切换为粗体字体", position: .center)
            }),
            ("恢复默认样式", {
                AMToastConfig.resetToDefault()
                AMToast.show(with: "已恢复默认样式", position: .center)
            })
        ])
    ]
    
    private let darkModeButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(systemName: "moon.fill"), for: .normal)
        button.backgroundColor = .systemBackground
        button.layer.cornerRadius = 25
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOffset = CGSize(width: 0, height: 2)
        button.layer.shadowRadius = 4
        button.layer.shadowOpacity = 0.2
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupDarkModeButton()
    }
    
    private func setupUI() {
        title = "AMToast Demo"
        view.backgroundColor = .systemBackground
        
        // 设置表格视图
        tableView.frame = view.bounds
        tableView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        view.addSubview(tableView)
    }
    
    private func setupDarkModeButton() {
        view.addSubview(darkModeButton)
        
        NSLayoutConstraint.activate([
            darkModeButton.widthAnchor.constraint(equalToConstant: 50),
            darkModeButton.heightAnchor.constraint(equalToConstant: 50),
            darkModeButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            darkModeButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20)
        ])
        
        darkModeButton.addTarget(self, action: #selector(darkModeButtonTapped), for: .touchUpInside)
        updateDarkModeButtonAppearance()
    }
    
    @objc private func darkModeButtonTapped() {
        if #available(iOS 13.0, *) {
            let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene
            let currentStyle = windowScene?.windows.first?.overrideUserInterfaceStyle ?? .unspecified
            
            let newStyle: UIUserInterfaceStyle = currentStyle == .dark ? .light : .dark
            windowScene?.windows.forEach { window in
                window.overrideUserInterfaceStyle = newStyle
            }
            
            // 显示切换提示
            let message = newStyle == .dark ? "已切换到深色模式" : "已切换到浅色模式"
            AMToast.show(with: message)
            
            // 更新按钮外观
            updateDarkModeButtonAppearance()
        }
    }
    
    private func updateDarkModeButtonAppearance() {
        if #available(iOS 13.0, *) {
            let isDarkMode = traitCollection.userInterfaceStyle == .dark
            darkModeButton.setImage(UIImage(systemName: isDarkMode ? "sun.max.fill" : "moon.fill"), for: .normal)
            darkModeButton.tintColor = isDarkMode ? .systemYellow : .systemBlue
        }
    }
    
    public override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)
        
        if #available(iOS 13.0, *) {
            if traitCollection.hasDifferentColorAppearance(comparedTo: previousTraitCollection) {
                updateDarkModeButtonAppearance()
            }
        }
    }
}

// MARK: - UITableViewDataSource
extension ViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return sections.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sections[section].examples.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        let example = sections[indexPath.section].examples[indexPath.row]
        cell.textLabel?.text = example.title
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sections[section].title
    }
}

// MARK: - UITableViewDelegate
extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let example = sections[indexPath.section].examples[indexPath.row]
        example.action()
    }
}

// MARK: - Section Model
private struct Section {
    let title: String
    let examples: [(title: String, action: () -> Void)]
} 
