import UIKit

extension UITextField {
    
    public func addLeftView(spacing: CGFloat) {
        leftView = UIView(frame: CGRect(x: 0, y: 0, width: spacing, height: frame.height))
        leftViewMode = .always
    }
}
