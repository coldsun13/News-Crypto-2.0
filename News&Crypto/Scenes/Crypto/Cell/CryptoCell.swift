import UIKit

protocol CryptoCellViewModel {
    var currentPrice: String { get }
    var name: String { get }
    var abbriviatedName: String { get }
    var priceChangePercantage24h: String { get }
    var cryptolineChart: CryptoLineChartView.ChartViewModel { get }
    var iconURLString: String { get }
}

final class CryptoCell: UITableViewCell {
    
    static let identifier = "CryptoCell"
    
    private enum Constant {
        static let coinStackViewLeadingInset: CGFloat = 10
        static let coinStackViewTrailingInset: CGFloat = -10
        static let coinStackViewBottomInset: CGFloat = -10
        static let coinStackViewTopInset: CGFloat = 10
        
        static let coinImageViewWidthSize: CGFloat = 30
        static let coinImageViewHeightSize: CGFloat = 30
        
        static let cryptoLineChartViewHeightSize: CGFloat = 50
    }
    
    //MARK: Lazy var properties
    private lazy var coinNameStackView: UIStackView = {
       let coinNameStackView = UIStackView()
        coinNameStackView.translatesAutoresizingMaskIntoConstraints = false
        coinNameStackView.axis = .vertical
        coinNameStackView.distribution = .fillProportionally
        coinNameStackView.alignment = .fill
        return coinNameStackView
    }()
    
    private lazy var priceStackView: UIStackView = {
       let priceStackView = UIStackView()
        priceStackView.axis = .vertical
        priceStackView.distribution = .fillProportionally
        priceStackView.alignment = .trailing
        
        return priceStackView
    }()
    
    private lazy var coinStackView: UIStackView = {
        let coinStackView = UIStackView()
        coinStackView.translatesAutoresizingMaskIntoConstraints = false
        coinStackView.axis = .horizontal
        coinStackView.distribution = .fillProportionally
        coinStackView.alignment = .center
        coinStackView.spacing = 15
        coinStackView.backgroundColor = .systemBackground
        return coinStackView
    }()
    
    private lazy var cryptoLineChartView: CryptoLineChartView = {
       let cryptoLineChartView = CryptoLineChartView()
        cryptoLineChartView.translatesAutoresizingMaskIntoConstraints = false
        cryptoLineChartView.clipsToBounds = true
        cryptoLineChartView.isUserInteractionEnabled = false
        return cryptoLineChartView
    }()
    
    private lazy var priceLabel: UILabel = {
        let priceLabel = UILabel()
//        priceLabel.font = .montserrat(16, .medium)
        priceLabel.adjustsFontSizeToFitWidth = true
        priceLabel.minimumScaleFactor = 0.5
        return priceLabel
    }()
    
    private lazy var coinImageView: WebImageView = {
        let coinImageView = WebImageView()
        coinImageView.translatesAutoresizingMaskIntoConstraints = false
        return coinImageView
    }()
    
    private lazy var coinNameLabel: UILabel = {
       let coinNameLabel = UILabel()
//        coinNameLabel.font = .montserrat(17, .medium)
        return coinNameLabel
    }()
    
    private lazy var coinAbbriviatedNameLabel: UILabel = {
        let coinAbbriviatedNameLabel = UILabel()
//        coinAbbriviatedNameLabel.font = .montserrat(15, .regular)
        coinAbbriviatedNameLabel.textColor = .gray
        return coinAbbriviatedNameLabel
    }()
    
    private lazy var changePriceLabel: UILabel = {
        let changePriceLabel = UILabel()
//        changePriceLabel.font = .montserrat(13, .regular)
        return changePriceLabel
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        drawSelf()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        coinImageView.layer.cornerRadius = coinImageView.frame.size.width / 2
        coinImageView.clipsToBounds = true
        coinImageView.contentMode = .scaleAspectFill
    }
    
    func set(viewModel: CryptoCellViewModel) {
        let changeMarketColor = Double(viewModel.priceChangePercantage24h) ?? 0.0 < 0
        coinImageView.set(imageURL: viewModel.iconURLString)
        priceLabel.text = viewModel.currentPrice
        coinNameLabel.text = viewModel.name
        coinAbbriviatedNameLabel.text = viewModel.abbriviatedName
        changePriceLabel.textColor = changeMarketColor ? .systemRed : .systemGreen
        changePriceLabel.text = viewModel.priceChangePercantage24h + "%"
        cryptoLineChartView.configure(viewModel: viewModel.cryptolineChart)
    }
}

private extension CryptoCell {
    
    func drawSelf() {
        addSubview(coinStackView)
        coinStackView.addAllArrangedSubviews(coinImageView,
                                             coinNameStackView,
                                             cryptoLineChartView,
                                             priceStackView)
        priceStackView.addAllArrangedSubviews(priceLabel,
                                              changePriceLabel)
        coinNameStackView.addAllArrangedSubviews(coinNameLabel,
                                                 coinAbbriviatedNameLabel)
        let coinStackViewConstraints = self.setCoinStackViewConstraints()
        let coinNameStackViewConstraints = self.setCoinNameStackViewConstraints()
        let coinImageViewConstraints = self.setCoinImageViewConstraints()
        let cryptolineChartView = self.setCryptoLineChartViewConstraints()
        
        NSLayoutConstraint.activate(coinStackViewConstraints +
                                    coinNameStackViewConstraints +
                                    coinImageViewConstraints +
                                    cryptolineChartView)
    }
    
    func setCoinStackViewConstraints() -> [NSLayoutConstraint] {
        let leadingAnchor = coinStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Constant.coinStackViewLeadingInset)
        let trailingAnchor = coinStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: Constant.coinStackViewTrailingInset)
        let bottomAnchor = coinStackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: Constant.coinStackViewBottomInset)
        let topAnchor = coinStackView.topAnchor.constraint(equalTo: topAnchor,constant: Constant.coinStackViewTopInset)
        
        return [leadingAnchor,
                trailingAnchor,
                bottomAnchor,
                topAnchor]
    }
    
    func setCoinNameStackViewConstraints() -> [NSLayoutConstraint] {
        let width = coinNameStackView.widthAnchor.constraint(equalTo: coinStackView.widthAnchor, multiplier: 0.25)
        return [width]
    }
    
    func setCoinImageViewConstraints() -> [NSLayoutConstraint] {
        let width = coinImageView.widthAnchor.constraint(equalToConstant: Constant.coinImageViewWidthSize)
        let height = coinImageView.heightAnchor.constraint(equalToConstant: Constant.coinImageViewHeightSize)
        return [width,
                height]
    }
    
    func setCryptoLineChartViewConstraints() -> [NSLayoutConstraint] {
        let width = cryptoLineChartView.widthAnchor.constraint(equalTo: coinStackView.widthAnchor, multiplier: 0.3)
        let height = cryptoLineChartView.heightAnchor.constraint(equalToConstant: Constant.cryptoLineChartViewHeightSize)
        return [width,
                height]
    }
}
