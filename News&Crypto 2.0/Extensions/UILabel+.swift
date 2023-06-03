import UIKit

extension UILabel {

    func setLineSpacing(lineSpacing: CGFloat = 0.0, lineHeightMultiple: CGFloat = 0.0) {

        guard let labelText = self.text else { return }

        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = lineSpacing
        paragraphStyle.lineHeightMultiple = lineHeightMultiple

        let attributedString:NSMutableAttributedString
        if let labelattributedText = self.attributedText {
            attributedString = NSMutableAttributedString(attributedString: labelattributedText)
        } else {
            attributedString = NSMutableAttributedString(string: labelText)
        }

        // (Swift 4.2 and above) Line spacing attribute
        attributedString.addAttribute(NSAttributedString.Key.paragraphStyle, value:paragraphStyle, range:NSMakeRange(0, attributedString.length))


        // (Swift 4.1 and 4.0) Line spacing attribute
        attributedString.addAttribute(NSAttributedString.Key.paragraphStyle, value:paragraphStyle, range:NSMakeRange(0, attributedString.length))

        attributedText = attributedString
    }
    
    func modificatorForCurrentPriceLabel(_ price: String, _ change: String, _ color: UIColor) -> NSMutableAttributedString {
        let firstAttributes: [NSAttributedString.Key: Any] = [
            NSAttributedString.Key.foregroundColor: UIColor.gray,
            NSAttributedString.Key.font: UIFont.montserrat(15, .medium)
        ]
        
        let secondAttributes: [NSAttributedString.Key: Any] = [
            NSAttributedString.Key.font: UIFont.montserrat(20, .bold)
        ]
        
        let thirdAttributes: [NSAttributedString.Key: Any] = [
            NSAttributedString.Key.foregroundColor: color,
            NSAttributedString.Key.font: UIFont.montserrat(12, .medium)
        ]
        
        let firstString = NSMutableAttributedString(string: "💸 Current Price\n", attributes: firstAttributes)
        
        let secondString = NSAttributedString(string: "\(price)\n", attributes: secondAttributes)
        let thirdString = NSAttributedString(string: "\(change)", attributes: thirdAttributes)
        firstString.append(secondString)
        firstString.append(thirdString)
        attributedText = firstString
        return firstString
    }
    
    func modificatorForCapitalizationLabel(_ price: String, _ change: String, _ color: UIColor) -> NSMutableAttributedString {
        let firstAttributes: [NSAttributedString.Key: Any] = [
            NSAttributedString.Key.foregroundColor: UIColor.gray,
            NSAttributedString.Key.font: UIFont.montserrat(13, .medium)
        ]
        
        let secondAttributes: [NSAttributedString.Key: Any] = [
            NSAttributedString.Key.font: UIFont.montserrat(20, .bold)
        ]
        
        let thirdAttributes: [NSAttributedString.Key: Any] = [
            NSAttributedString.Key.foregroundColor: color,
            NSAttributedString.Key.font: UIFont.montserrat(12, .medium)
        ]
        
        let firstString = NSMutableAttributedString(string: "🏦 Market Capitalization\n", attributes: firstAttributes)
        
        let secondString = NSAttributedString(string: "$ \(price)\n", attributes: secondAttributes)
        let thirdString = NSAttributedString(string: "\(change)", attributes: thirdAttributes)
        firstString.append(secondString)
        firstString.append(thirdString)
        attributedText = firstString
        return firstString
    }
    
    func modificatorForRankLabel(_ rank: String) -> NSMutableAttributedString {
        let firstAttributes: [NSAttributedString.Key: Any] = [
            NSAttributedString.Key.foregroundColor: UIColor.gray,
            NSAttributedString.Key.font: UIFont.montserrat(13, .medium)
        ]
        
        let secondAttributes: [NSAttributedString.Key: Any] = [
            NSAttributedString.Key.font: UIFont.montserrat(20, .bold)
        ]
        
        let firstString = NSMutableAttributedString(string: "🏆 Rank\n", attributes: firstAttributes)
        
        let secondString = NSAttributedString(string: "\(rank)", attributes: secondAttributes)
        firstString.append(secondString)
        attributedText = firstString
        return firstString
    }
    
    func modificatorForVolumeLabel(_ volume: String) -> NSMutableAttributedString {
        let firstAttributes: [NSAttributedString.Key: Any] = [
            NSAttributedString.Key.foregroundColor: UIColor.gray,
            NSAttributedString.Key.font: UIFont.montserrat(13, .medium)
        ]
        
        let secondAttributes: [NSAttributedString.Key: Any] = [
            NSAttributedString.Key.font: UIFont.montserrat(20, .bold)
        ]
        
        let firstString = NSMutableAttributedString(string: "💰 Volume\n", attributes: firstAttributes)
        
        let secondString = NSAttributedString(string: "$ \(volume)", attributes: secondAttributes)
        firstString.append(secondString)
        attributedText = firstString
        return firstString
    }

    func addCharacterSpacing(kernValue: Double = 1.15) {
        guard let text = text, !text.isEmpty else { return }
        let string = NSMutableAttributedString(string: text)
        string.addAttribute(NSAttributedString.Key.kern, value: kernValue, range: NSRange(location: 0, length: string.length - 1))
        attributedText = string
    }
}
