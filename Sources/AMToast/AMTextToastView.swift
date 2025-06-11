import UIKit

class AMTextToastView: AMToastView {
    private let messageLabel: UILabel
    
    init(message: String) {
        let label = UILabel()
        label.text = message
        label.textColor = AMToastConfig.ToastViewStyle.TextColor.current
        label.font = AMToastConfig.ToastViewStyle.Font.current
        label.numberOfLines = 0
        label.textAlignment = .center
        label.sizeToFit()
        
        messageLabel = label
        super.init(frame: .zero)
        customView = label
    }
    
    required init?(coder: NSCoder) {
        messageLabel = UILabel()
        super.init(coder: coder)
    }
    
    public override func updateAppearance() {
        super.updateAppearance()
        messageLabel.textColor = AMToastConfig.ToastViewStyle.TextColor.current
        messageLabel.font = AMToastConfig.ToastViewStyle.Font.current
    }
} 
