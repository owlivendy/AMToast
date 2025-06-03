import UIKit

extension UIImage {
    static func am_toastImage(named name: String) -> UIImage? {
        let bundle = Bundle(for: AMToast.self)
        if let bundlePath = bundle.path(forResource: "AMToast", ofType: "bundle"),
           let resourceBundle = Bundle(path: bundlePath) {
            return UIImage(named: name, in: resourceBundle, compatibleWith: nil)
        }
        return nil
    }
} 
