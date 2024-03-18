import UIKit

extension UIStackView {
    
    public func addAllArrangedSubviews(_ views: UIView...) {
        views.forEach { view in
            view.translatesAutoresizingMaskIntoConstraints = false
            addArrangedSubview(view)
        }
    }
}
