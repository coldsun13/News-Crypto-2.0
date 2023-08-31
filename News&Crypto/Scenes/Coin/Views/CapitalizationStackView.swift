import UIKit

final class CapitalizationStackView: UIStackView {
    // MARK: - Properties
    
    // MARK: Private
    private lazy var currentAndCapitalizationStackView: UIStackView = {
        let currentAndCapitalizationStackView = UIStackView()
        currentAndCapitalizationStackView.axis = .horizontal
        currentAndCapitalizationStackView.distribution = .fillEqually
        currentAndCapitalizationStackView.alignment = .leading
        return currentAndCapitalizationStackView
    }()
    
    private lazy var rankAndVolumeStackView: UIStackView = {
        let rankAndVolumeStackView = UIStackView()
        rankAndVolumeStackView.axis = .horizontal
        rankAndVolumeStackView.distribution = .fillEqually
        rankAndVolumeStackView.alignment = .leading
        return rankAndVolumeStackView
    }()
    
    private lazy var currentPriceLabel: UILabel = {
        let currentPriceLabel = UILabel()
        currentPriceLabel.numberOfLines = 3
        return currentPriceLabel
    }()
    
    private lazy var capitalizationLabel: UILabel = {
        let capitalizationLabel = UILabel()
        capitalizationLabel.numberOfLines = 3
        return capitalizationLabel
    }()
    
    private lazy var rankLabel: UILabel = {
        let rankLabel = UILabel()
        rankLabel.numberOfLines = 2
        return rankLabel
    }()
    
    private lazy var volumeLabel: UILabel = {
        let volumeLabel = UILabel()
        volumeLabel.numberOfLines = 2
        return volumeLabel
    }()
    
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

private extension CapitalizationStackView {
    
    func addSubviews() {
        addAllArrangedSubviews(currentAndCapitalizationStackView,
                               rankAndVolumeStackView)
        currentAndCapitalizationStackView.addAllArrangedSubviews(currentPriceLabel,
                                                                 capitalizationLabel)
        rankAndVolumeStackView.addAllArrangedSubviews(rankLabel,
                                                      volumeLabel)
    }
    
    func addSetups() {
        axis = .vertical
        distribution = .fillEqually
        alignment = .fill
    }
}
