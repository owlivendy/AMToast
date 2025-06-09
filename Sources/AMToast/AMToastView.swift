import UIKit

public class AMToastView: UIView {
    public var contentInsets: UIEdgeInsets = UIEdgeInsets(top: 10, left: 15, bottom: 10, right: 15) {
        didSet {
            content_top?.constant = contentInsets.top
            content_bottom?.constant = contentInsets.bottom
            content_leading?.constant = contentInsets.left
            content_trailing?.constant = contentInsets.right
        }
    }
    private var content_top: NSLayoutConstraint?
    private var content_bottom: NSLayoutConstraint?
    private var content_leading: NSLayoutConstraint?
    private var content_trailing: NSLayoutConstraint?
    
    public var customView: UIView? {
        didSet {
            oldValue?.removeFromSuperview()
            if let customView = customView {
                addSubview(customView)
                customView.translatesAutoresizingMaskIntoConstraints = false
                content_top = customView.topAnchor.constraint(equalTo: self.topAnchor, constant: contentInsets.top)
                content_bottom = self.bottomAnchor.constraint(equalTo: customView.bottomAnchor, constant: contentInsets.bottom)
                content_leading = customView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: contentInsets.left)
                content_trailing = self.trailingAnchor.constraint(equalTo: customView.trailingAnchor, constant: contentInsets.right)
                NSLayoutConstraint.activate([
                    content_top!,
                    content_bottom!,
                    content_leading!,
                    content_trailing!
                ])
            }
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupUI()
    }
    
    func setupUI() {
        backgroundColor = AMToastConfig.ToastViewStyle.backgroundColor
        layer.cornerRadius = AMToastConfig.ToastViewStyle.cornerRadius
        clipsToBounds = true
    }
} 
