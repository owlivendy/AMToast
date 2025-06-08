//
//  ViewController.swift
//  AMToast
//
//  Created by sxf on 05/30/2025.
//  Copyright (c) 2025 sxf. All rights reserved.
//

import UIKit
import AMToast

class ViewController: UIViewController {
    
    @IBOutlet weak var tableview: UITableView!
    
    private struct Section {
        let title: String
        let examples: [(title: String, action: () -> Void)]
    }
    
    private let sections: [Section] = [
        Section(title: "基本用法", examples: [
            ("顶部显示单个 Toast", {
                AMToast.show(with: "这是一个顶部显示的 Toast", position: .top)
            }),
            ("中间显示单个 Toast", {
                AMToast.show(with: "这是一个中间显示的 Toast", position: .center)
            }),
            ("显示成功 Toast", {
                AMToast.showSuccess(with: "操作成功！", position: .center)
            })
        ]),
        Section(title: "位置配置", examples: [
            ("显示当前顶部边距", {
                let isLandscape = UIDevice.current.orientation.isLandscape
                let currentMargin = isLandscape ? AMToastConfig.Position.topMarginLandscape : AMToastConfig.Position.topMarginPortrait
                AMToast.show(with: "当前顶部边距: \(currentMargin)", position: .top)
            }),
            ("修改顶部边距为50", {
                AMToastConfig.Position.topMarginPortrait = 50
                AMToast.show(with: "已将顶部边距修改为50", position: .top)
            }),
            ("修改顶部边距为150", {
                AMToastConfig.Position.topMarginPortrait = 150
                AMToast.show(with: "已将顶部边距修改为150", position: .top)
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
            ("修改背景色为红色", {
                AMToastConfig.ToastViewStyle.backgroundColor = UIColor.red.withAlphaComponent(0.94)
                AMToast.show(with: "已将背景色修改为红色", position: .center)
            }),
            ("修改背景色为蓝色", {
                AMToastConfig.ToastViewStyle.backgroundColor = UIColor.blue.withAlphaComponent(0.94)
                AMToast.show(with: "已将背景色修改为蓝色", position: .center)
            }),
            ("恢复默认样式", {
                AMToastConfig.ToastViewStyle.cornerRadius = 18.0
                AMToastConfig.ToastViewStyle.backgroundColor = UIColor.black.withAlphaComponent(0.94)
                AMToast.show(with: "已恢复默认样式", position: .center)
            })
        ]),
        Section(title: "高级用法", examples: [
            ("显示自定义样式Toast", {
                // 创建自定义视图
                let customView = UIView()
                customView.backgroundColor = .clear
                
                // 创建图标
                var imageView:UIImageView!
                if #available(iOS 13.0, *) {
                    imageView = UIImageView(image: UIImage(systemName: "star.fill"))
                } else {
                    // Fallback on earlier versions
                }
                imageView.tintColor = .yellow
                imageView.contentMode = .scaleAspectFit
                imageView.translatesAutoresizingMaskIntoConstraints = false
                customView.addSubview(imageView)
                
                // 创建标签
                let label = UILabel()
                label.text = "自定义样式Toast"
                label.textColor = .white
                label.font = .systemFont(ofSize: 16, weight: .medium)
                label.translatesAutoresizingMaskIntoConstraints = false
                customView.addSubview(label)
                
                // 设置约束
                NSLayoutConstraint.activate([
                    imageView.leadingAnchor.constraint(equalTo: customView.leadingAnchor),
                    imageView.centerYAnchor.constraint(equalTo: customView.centerYAnchor),
                    imageView.widthAnchor.constraint(equalToConstant: 24),
                    imageView.heightAnchor.constraint(equalToConstant: 24),
                    
                    label.leadingAnchor.constraint(equalTo: imageView.trailingAnchor, constant: 8),
                    label.trailingAnchor.constraint(equalTo: customView.trailingAnchor),
                    label.centerYAnchor.constraint(equalTo: customView.centerYAnchor)
                ])
                
                // 创建Toast视图
                let toastView = AMToastView()
                toastView.contentInsets = UIEdgeInsets(top: 12, left: 20, bottom: 12, right: 20)
                toastView.customView = customView
                
                // 显示Toast
                AMToast.show(with: toastView, position: .center)
            })
        ])
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
    }
    
    private func setupTableView() {
        tableview.delegate = self
        tableview.dataSource = self
        tableview.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

// MARK: - UITableViewDataSource
extension ViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return sections.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sections[section].title
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sections[section].examples.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = sections[indexPath.section].examples[indexPath.row].title
        return cell
    }
}

// MARK: - UITableViewDelegate
extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        sections[indexPath.section].examples[indexPath.row].action()
    }
}

