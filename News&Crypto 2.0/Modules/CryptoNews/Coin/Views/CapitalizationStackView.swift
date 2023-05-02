import UIKit

final class CapitalizationStackView: UIStackView {
    // MARK: - Properties
    
    // MARK: Private

    private let currentAndCapitalizationStackView = UIStackView()
    private let currentPriceLabel = UILabel()
    private let capitalizationLabel = UILabel()
    private let rankAndVolumeStackView = UIStackView()
    private let rankLabel = UILabel()
    private let volumeLabel = UILabel()
    
    // MARK: - Initialization
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubviews()
        addSetups()
        addContraints()
    }
    
    @available(*, unavailable)
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Lifecycle
    
    override func layoutSubviews() {
        super.layoutSubviews()
        DispatchQueue.main.async { [weak self] in
            self?.currentPriceLabel.setLineSpacing(lineSpacing: 4.0)
            self?.capitalizationLabel.setLineSpacing(lineSpacing: 4.0)
            self?.rankLabel.setLineSpacing(lineSpacing: 4.0)
            self?.volumeLabel.setLineSpacing(lineSpacing: 4.0)
        }
    }
    
    // MARK: - API
    
    public func setCurrentPriceLabel(_ price: String, _ change: String, _ color: UIColor) {
        currentPriceLabel.attributedText = modificatorForCurrentPriceLabel(price,
                                                                           change,
                                                                           color)
    }
    
    public func setCapitalizationLabel(_ price: String, _ change: String, _ color: UIColor) {
        capitalizationLabel.attributedText = modificatorForCapitalizationLabel(price,
                                                                               change,
                                                                               color)
    }
    
    public func setRankLabel(_ rank: String) {
        rankLabel.attributedText = modificatorForRankLabel(rank)
    }
    
    public func setVolumeLabel(_ volume: String) {
        volumeLabel.attributedText = modificatorForVolumeLabel(volume)
    }
    
    // MARK: - Constraints
    
    // MARK: Private
    
    private func addContraints() {}
    
    // MARK: - Setups
    
    // MARK: Private
    
    private func addSubviews() {
        addAllArrangedSubviews(currentAndCapitalizationStackView,
                            rankAndVolumeStackView)
        currentAndCapitalizationStackView.addAllArrangedSubviews(currentPriceLabel,
                                                              capitalizationLabel)
        rankAndVolumeStackView.addAllArrangedSubviews(rankLabel,
                                                   volumeLabel)
    }
    
    private func addSetups() {
        addStackViewSetups()
        addCurrentAndCapitalizationStackViewSetups()
        addRankAndVolumeStackViewSetups()
        addLabelsNumberLinesSetup()
    }
    
    private func addStackViewSetups() {
        axis = .vertical
        distribution = .fillEqually
        alignment = .fill
    }
    
    private func addCurrentAndCapitalizationStackViewSetups() {
        currentAndCapitalizationStackView.axis = .horizontal
        currentAndCapitalizationStackView.distribution = .fillEqually
        currentAndCapitalizationStackView.alignment = .leading
    }
    
    private func addRankAndVolumeStackViewSetups() {
        rankAndVolumeStackView.axis = .horizontal
        rankAndVolumeStackView.distribution = .fillEqually
        rankAndVolumeStackView.alignment = .leading
    }
    
    private func addLabelsNumberLinesSetup() {
        currentPriceLabel.numberOfLines = 3
        capitalizationLabel.numberOfLines = 3
        rankLabel.numberOfLines = 2
        volumeLabel.numberOfLines = 2
    }
    
    // MARK: - Helpers
    
    // MARK: Private
    
    private func modificatorForCurrentPriceLabel(_ price: String, _ change: String, _ color: UIColor) -> NSMutableAttributedString {
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
        return firstString
    }
    
    private func modificatorForCapitalizationLabel(_ price: String, _ change: String, _ color: UIColor) -> NSMutableAttributedString {
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
        
        let firstString = NSMutableAttributedString(string: "🏦 Market Capitalization\n", attributes: firstAttributes)
        
        let secondString = NSAttributedString(string: "$ \(price)\n", attributes: secondAttributes)
        let thirdString = NSAttributedString(string: "\(change)", attributes: thirdAttributes)
        firstString.append(secondString)
        firstString.append(thirdString)
        return firstString
    }
    
    private func modificatorForRankLabel(_ rank: String) -> NSMutableAttributedString {
        let firstAttributes: [NSAttributedString.Key: Any] = [
            NSAttributedString.Key.foregroundColor: UIColor.gray,
            NSAttributedString.Key.font: UIFont.montserrat(15, .medium)
        ]
        
        let secondAttributes: [NSAttributedString.Key: Any] = [
            NSAttributedString.Key.font: UIFont.montserrat(20, .bold)
        ]
        
        let firstString = NSMutableAttributedString(string: "🏆 Rank\n", attributes: firstAttributes)
        
        let secondString = NSAttributedString(string: "\(rank)", attributes: secondAttributes)
        firstString.append(secondString)
        return firstString
    }
    
    private func modificatorForVolumeLabel(_ volume: String) -> NSMutableAttributedString {
        let firstAttributes: [NSAttributedString.Key: Any] = [
            NSAttributedString.Key.foregroundColor: UIColor.gray,
            NSAttributedString.Key.font: UIFont.montserrat(15, .medium)
        ]
        
        let secondAttributes: [NSAttributedString.Key: Any] = [
            NSAttributedString.Key.font: UIFont.montserrat(20, .bold)
        ]
        
        let firstString = NSMutableAttributedString(string: "💰 Volume\n", attributes: firstAttributes)
        
        let secondString = NSAttributedString(string: "$ \(volume)", attributes: secondAttributes)
        firstString.append(secondString)
        return firstString
    }
}
