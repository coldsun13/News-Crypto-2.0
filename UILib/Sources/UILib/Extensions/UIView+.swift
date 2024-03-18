import UIKit

extension UIView {
    
    public func addSubviewsAndMask(_ views: UIView...) {
        views.forEach { view in
            view.translatesAutoresizingMaskIntoConstraints = false
            addSubview(view)
        }
    }
    
    public func addMaskForAllViews(_ views: UIView...) {
        views.forEach { view in
            view.translatesAutoresizingMaskIntoConstraints = false
        }
    }
    
    public func addShadow() {
        layer.shadowOpacity = 0.5
        layer.shadowRadius = 15
        layer.shadowOffset = CGSize(width: 0, height: 0)
        layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.1).cgColor
    }
}
