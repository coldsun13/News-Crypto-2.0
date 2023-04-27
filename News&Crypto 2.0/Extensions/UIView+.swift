import UIKit

extension UIView {
    
    func addAllSubviews(_ views: UIView...) {
        views.forEach(addSubview)
    }
    
    func addMaskForAllViews(_ views: UIView...) {
        views.forEach { view in
            view.translatesAutoresizingMaskIntoConstraints = false
        }
    }
}
