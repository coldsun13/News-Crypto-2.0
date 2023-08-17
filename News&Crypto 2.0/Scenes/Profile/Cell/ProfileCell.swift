import UIKit

protocol ProfileCellViewModel {
    var name: String { get }
    var price: String { get }
    var iconUrlString: String { get }
    var cryptolineChart: CryptoLineChartView.ChartViewModel { get }
    var changePrice: String { get }
    var abbriviatedName: String { get }
    var changePriceImage: String { get }
}

final class ProfileCell: UICollectionViewCell {
    
    static let identifier = "WalletCell"
    
    enum Constants {
        static let mainStackViewTopInset: CGFloat = 10
        static let mainStackViewLeadingInset: CGFloat = 15
        static let mainStackViewTrailingInset: CGFloat = -15
        
        static let priceLabelTopInset: CGFloat = 10
        static let priceLabelLeadingInset: CGFloat = 15
        
        static let coinImageViewWidthSize: CGFloat = 30
        
        static let changePriceStackViewTopInset: CGFloat = 10
        static let changePriceStackViewLeadingInset: CGFloat = 15
        
        static let cryptoLineChartViewTopInset: CGFloat = 5
        static let cryptoLineChartViewLeadingInset: CGFloat = 5
        static let cryptoLineChartViewBottomInset: CGFloat = -5
        
        static let changePriceImageViewWidthSize: CGFloat = 20
        static let changePriceImageViewHeightSize: CGFloat = 20
    }
    
    private lazy var mainView: UIView = {
        let mainView = UIView()
        mainView.layer.cornerRadius = 15
        mainView.backgroundColor = .yellow
        return mainView
    }()
    
    private lazy var mainStackView: UIStackView = {
        let mainStackView = UIStackView()
        mainStackView.alignment = .center
        return mainStackView
    }()
    
    private lazy var changePriceStackView: UIStackView = {
        let changePriceStackView = UIStackView()
        return changePriceStackView
    }()
    
    private lazy var nameCryptoLabel: UILabel = {
        let nameCryptoLabel = UILabel()
//        nameCryptoLabel.font = .montserrat(30, .bold)
        nameCryptoLabel.numberOfLines = 2
        return nameCryptoLabel
    }()
    
    private lazy var priceLabel: UILabel = {
        let priceLabel = UILabel()
//        priceLabel.font = .montserrat(30, .bold)
        return priceLabel
    }()
    
    private lazy var changePriceImageView: UIImageView = {
        let changePriceImageView = UIImageView()
        changePriceImageView.tintColor = .systemGreen
        return changePriceImageView
    }()
    
    private lazy var changePriceLabel: UILabel = {
        let changePriceLabel = UILabel()
//        changePriceLabel.font = .montserrat(15, .regular)
        changePriceLabel.textColor = .black
        return changePriceLabel
    }()
    
    private lazy var coinImageView: WebImageView = {
        let coinImageView = WebImageView()
        coinImageView.layer.cornerRadius = coinImageView.frame.size.width / 2
        coinImageView.clipsToBounds = true
        coinImageView.contentMode = .scaleAspectFill
        return coinImageView
    }()
    
    private lazy var cryptoLineChartView: CryptoLineChartView = {
        let cryptoLineChartView = CryptoLineChartView()
        cryptoLineChartView.clipsToBounds = true
        cryptoLineChartView.isUserInteractionEnabled = false
        return cryptoLineChartView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        drawSelf()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func set(viewModel: ProfileCellViewModel) {
        nameCryptoLabel.attributedText = modificatorForNameCoinLabel(viewModel.name, viewModel.abbriviatedName)
        priceLabel.text = viewModel.price
        coinImageView.set(imageURL: viewModel.iconUrlString)
        cryptoLineChartView.configure(viewModel: viewModel.cryptolineChart)
        changePriceLabel.text = viewModel.changePrice + "%"
        changePriceImageView.image = UIImage(systemName: viewModel.changePriceImage)
    }
}

private extension ProfileCell {
    
    func drawSelf() {
        addSubview(mainView)
        mainView.addSubviewsAndMask(mainStackView,
                                    priceLabel,
                                    changePriceStackView,
                                    cryptoLineChartView)
        mainStackView.addAllArrangedSubviews(nameCryptoLabel,
                                             coinImageView)
        changePriceStackView.addAllArrangedSubviews(changePriceImageView,
                                                    changePriceLabel)
        addMaskForAllViews(mainView, mainStackView, priceLabel, changePriceStackView, cryptoLineChartView)
        
        let mainViewConstraints = self.setMainViewConstraints()
        let mainStackViewConstraints = self.setMainStackViewConstraints()
        let priceLabelConstraints = self.setPriceLabelConstraints()
        let coinImageViewConstraints = self.setCoinImageViewConstraints()
        let changePriceStackViewConstraints = self.setChangePriceStackViewConstraints()
        let cryptolineChartViewConstraints = self.setCryptoLineChartViewConstraints()
        let changePriceImageViewConstraints = self.setChangePriceImageViewConstraints()
        
        NSLayoutConstraint.activate(mainViewConstraints +
                                    mainStackViewConstraints +
                                    priceLabelConstraints +
                                    coinImageViewConstraints +
                                    changePriceImageViewConstraints +
                                    changePriceStackViewConstraints +
                                    cryptolineChartViewConstraints)
    }
    
    func setMainViewConstraints() -> [NSLayoutConstraint] {
        let leadingAnchor = mainView.leadingAnchor.constraint(equalTo: leadingAnchor)
        let trailingAnchor = mainView.trailingAnchor.constraint(equalTo: trailingAnchor)
        let topAnchor = mainView.topAnchor.constraint(equalTo: topAnchor)
        let bottomAnchor = mainView.bottomAnchor.constraint(equalTo: bottomAnchor)
        
        return [leadingAnchor,
                trailingAnchor,
                topAnchor,
                bottomAnchor]
    }
    
    func setMainStackViewConstraints() -> [NSLayoutConstraint] {
        let topAnchor = mainStackView.topAnchor.constraint(equalTo: mainView.topAnchor, constant: Constants.mainStackViewTopInset)
        let leadingAnchor = mainStackView.leadingAnchor.constraint(equalTo: mainView.leadingAnchor, constant: Constants.mainStackViewLeadingInset)
        let trailingAnchor = mainStackView.trailingAnchor.constraint(equalTo: mainView.trailingAnchor, constant: Constants.mainStackViewLeadingInset)
        
        return [topAnchor,
                leadingAnchor,
                trailingAnchor]
    }
    
    func setPriceLabelConstraints() -> [NSLayoutConstraint] {
        let topAnchor = priceLabel.topAnchor.constraint(equalTo: mainStackView.bottomAnchor, constant: Constants.priceLabelTopInset)
        let leadingAnchor = priceLabel.leadingAnchor.constraint(equalTo: mainView.leadingAnchor, constant: Constants.priceLabelLeadingInset)
        
        return [topAnchor,
                leadingAnchor]
    }
    
    func setCoinImageViewConstraints() -> [NSLayoutConstraint] {
        let width = coinImageView.widthAnchor.constraint(equalToConstant: Constants.coinImageViewWidthSize)
        let height = coinImageView.heightAnchor.constraint(equalTo: coinImageView.widthAnchor)
        
        return [width,
                height]
    }
    
    func setChangePriceStackViewConstraints() -> [NSLayoutConstraint] {
        let topAnchor = changePriceStackView.topAnchor.constraint(equalTo: priceLabel.bottomAnchor, constant: Constants.changePriceStackViewTopInset)
        let leadingAnchor = changePriceStackView.leadingAnchor.constraint(equalTo: mainView.leadingAnchor, constant: Constants.changePriceStackViewLeadingInset)
        let width = changePriceStackView.widthAnchor.constraint(equalTo: mainView.widthAnchor, multiplier: 0.5)
        
        return [topAnchor,
                leadingAnchor,
                width]
    }
    
    func setCryptoLineChartViewConstraints() -> [NSLayoutConstraint] {
        let topAnchor = cryptoLineChartView.topAnchor.constraint(equalTo: changePriceStackView.bottomAnchor, constant: Constants.cryptoLineChartViewTopInset)
        let leadingAnchor = cryptoLineChartView.leadingAnchor.constraint(equalTo: mainView.leadingAnchor, constant: Constants.cryptoLineChartViewLeadingInset)
        let bottomAnchor = cryptoLineChartView.bottomAnchor.constraint(equalTo: mainView.bottomAnchor, constant: Constants.cryptoLineChartViewBottomInset)
        let widthAnchor = cryptoLineChartView.widthAnchor.constraint(equalTo: mainView.widthAnchor, multiplier: 0.8)
        
        return [topAnchor,
                leadingAnchor,
                bottomAnchor,
                widthAnchor]
    }
    
    func setChangePriceImageViewConstraints() -> [NSLayoutConstraint] {
        let width = changePriceImageView.widthAnchor.constraint(equalToConstant: Constants.changePriceImageViewWidthSize)
        let height = changePriceImageView.heightAnchor.constraint(equalToConstant: Constants.changePriceImageViewHeightSize)
        
        return [width,
                height]
    }
    
    func modificatorForNameCoinLabel(_ coinName: String, _ coinSymbol: String) -> NSMutableAttributedString {
        let firstAttributes: [NSAttributedString.Key: Any] = [
            NSAttributedString.Key.font: UIFont.montserrat(20, .bold)
        ]
        
        let secondAttributes: [NSAttributedString.Key: Any] = [
            NSAttributedString.Key.foregroundColor: UIColor.gray,
            NSAttributedString.Key.font: UIFont.montserrat(12, .medium)
        ]
        
        let firstString = NSMutableAttributedString(string: "\(coinName)\n", attributes: firstAttributes)
        
        let secondString = NSAttributedString(string: "\(coinSymbol.uppercased())", attributes: secondAttributes)
        firstString.append(secondString)
        return firstString
    }
}
