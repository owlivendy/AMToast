import UIKit

class AMTextToastView: AMToastView {
    private let messageLabel: UILabel
    
    init(message: String) {
        let label = UILabel()
        label.text = message
        label.textColor = .white
        label.font = .systemFont(ofSize: 14)
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
} 
