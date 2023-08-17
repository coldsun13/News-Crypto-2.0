import UIKit
import UILib

extension UIFont {
    
    public static func montserrat(_ size: CGFloat, _ weight: Resources.Strings.FontWeight) -> UIFont {
        UIFont(name: weight.rawValue, size: size)!
    }
}

