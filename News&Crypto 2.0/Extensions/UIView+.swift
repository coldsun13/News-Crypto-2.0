import UIKit

extension UIView {
    
    func addAllSubviews(_ views: UIView...) {
        views.forEach { $0.addSubview(self) }
    }
}
