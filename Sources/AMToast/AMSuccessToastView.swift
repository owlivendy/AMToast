import UIKit

class AMSuccessToastView: AMToastView {
    private let successImage: UIImageView
    private let messageLabel: UILabel
    
    init(message: String) {
        // 创建容器视图
        let containerView = UIView()
        containerView.translatesAutoresizingMaskIntoConstraints = false
        
        // 创建成功图标
        let imageView = UIImageView()
        imageView.image = UIImage.am_toastImage(named: "success")
//        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        containerView.addSubview(imageView)
        successImage = imageView
        
        // 创建消息标签
        let label = UILabel()
        label.text = message
        label.textColor = AMToastConfig.ToastViewStyle.TextColor.current
        label.font = AMToastConfig.ToastViewStyle.Font.current
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        containerView.addSubview(label)
        messageLabel = label
        
        super.init(frame: .zero)
        
        // 设置约束
        NSLayoutConstraint.activate([
            // 成功图标约束
            successImage.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            successImage.centerYAnchor.constraint(equalTo: containerView.centerYAnchor),
            
            // 消息标签约束
            messageLabel.leadingAnchor.constraint(equalTo: successImage.trailingAnchor, constant: 5),
            messageLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
            messageLabel.topAnchor.constraint(equalTo: containerView.topAnchor),
            messageLabel.bottomAnchor.constraint(equalTo: containerView.bottomAnchor)
        ])
        
        customView = containerView
    }
    
    required init?(coder: NSCoder) {
        successImage = UIImageView()
        messageLabel = UILabel()
        super.init(coder: coder)
    }
    
    public override func updateAppearance() {
        super.updateAppearance()
        messageLabel.textColor = AMToastConfig.ToastViewStyle.TextColor.current
        messageLabel.font = AMToastConfig.ToastViewStyle.Font.current
    }
} 
