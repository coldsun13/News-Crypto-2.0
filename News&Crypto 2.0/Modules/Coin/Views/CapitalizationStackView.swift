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
    
    func setCurrentPriceLabel(_ price: String, _ change: String, _ color: UIColor) {
        currentPriceLabel.modificatorForCurrentPriceLabel(price, change, color)
    }
    
    func setCapitalizationLabel(_ price: String, _ change: String, _ color: UIColor) {
        capitalizationLabel.modificatorForCapitalizationLabel(price, change, color)
    }
    
    func setRankLabel(_ rank: String) {
        rankLabel.modificatorForRankLabel(rank)
    }
    
    func setVolumeLabel(_ volume: String) {
        volumeLabel.modificatorForVolumeLabel(volume)
    }
    
    // MARK: - Setups
    
    // MARK: Private
}

extension CapitalizationStackView {
    
    func addSubviews() {
        addAllArrangedSubviews(currentAndCapitalizationStackView,
                            rankAndVolumeStackView)
        currentAndCapitalizationStackView.addAllArrangedSubviews(currentPriceLabel,
                                                              capitalizationLabel)
        rankAndVolumeStackView.addAllArrangedSubviews(rankLabel,
                                                   volumeLabel)
    }
    
    func addSetups() {
        addStackViewSetups()
        addCurrentAndCapitalizationStackViewSetups()
        addRankAndVolumeStackViewSetups()
        addLabelsNumberLinesSetup()
    }
    
    func addStackViewSetups() {
        axis = .vertical
        distribution = .fillEqually
        alignment = .fill
    }
    
    func addCurrentAndCapitalizationStackViewSetups() {
        currentAndCapitalizationStackView.axis = .horizontal
        currentAndCapitalizationStackView.distribution = .fillEqually
        currentAndCapitalizationStackView.alignment = .leading
    }
    
    func addRankAndVolumeStackViewSetups() {
        rankAndVolumeStackView.axis = .horizontal
        rankAndVolumeStackView.distribution = .fillEqually
        rankAndVolumeStackView.alignment = .leading
    }
    
    func addLabelsNumberLinesSetup() {
        currentPriceLabel.numberOfLines = 3
        capitalizationLabel.numberOfLines = 3
        rankLabel.numberOfLines = 2
        volumeLabel.numberOfLines = 2
    }
}
