import UIKit

extension UIFont {
    
    static func montserrat(_ size: CGFloat, _ weight: Resources.Strings.FontWeight) -> UIFont {
        UIFont(name: weight.rawValue, size: size)!
    }
}

