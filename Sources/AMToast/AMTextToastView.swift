import UIKit

class AMTextToastView: AMToastView {
    private let messageLabel: UILabel
    
    init(message: String) {
        let label = UILabel(frame: .zero)
        label.text = message
        label.textColor = AMToastConfig.ToastViewStyle.textColor
        label.font = AMToastConfig.ToastViewStyle.textFont
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.textAlignment = .center
        // 允许横向压缩，配合最大宽度约束实现自动换行
        label.setContentCompressionResistancePriority(.defaultLow, for: .horizontal)
        label.setContentHuggingPriority(.required, for: .vertical)
        
        messageLabel = label
        super.init(frame: .zero)
        customView = label
    }
    
    required init?(coder: NSCoder) {
        messageLabel = UILabel(frame: .zero)
        super.init(coder: coder)
    }
}
