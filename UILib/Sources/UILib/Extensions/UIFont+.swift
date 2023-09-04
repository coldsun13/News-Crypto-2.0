import UIKit

extension UIFont {
    
    public static func montserrat(_ size: CGFloat, _ weight: Resources.Strings.FontWeight) -> UIFont {
        UIFont(name: weight.rawValue, size: size) ?? UIFont.systemFont(ofSize: 15, weight: .medium)
        
    }
}

