import UIKit

protocol WalletCellViewModel {
    var name: String { get }
    var price: String { get }
    var iconUrlString: String { get }
    var cryptolineChart: CryptoLineChartView.ViewModel { get }
    var changePrice: String { get }
    var abbriviatedName: String { get }
    var changePriceImage: String { get }
}

final class WalletCell: UITableViewCell {
    
    static let identifier = "WalletCell"
    
    private let mainView = UIView()
    private let mainStackView = UIStackView()
    private let changePriceStackView = UIStackView()
    
    private let nameCryptoLabel = UILabel()
    private let priceLabel = UILabel()
    private let changePriceImageView = UIImageView()
    private let changePriceLabel = UILabel()
    private let coinImageView = WebImageView()
    private let cryptoLineChartView = CryptoLineChartView()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubviews()
        addConstraints()
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func set(viewModel: WalletCellViewModel) {
        nameCryptoLabel.attributedText = modificatorForNameCoinLabel(viewModel.name, viewModel.abbriviatedName)
        priceLabel.text = viewModel.price
        coinImageView.set(imageURL: viewModel.iconUrlString)
        cryptoLineChartView.configure(viewModel: viewModel.cryptolineChart)
        changePriceLabel.text = viewModel.changePrice
        changePriceImageView.image = UIImage(systemName: viewModel.changePriceImage)
    }
}

private extension WalletCell {
    
    func addSubviews() {
        addSubview(mainView)
        mainView.addAllSubviews(mainStackView,
                                priceLabel,
                                changePriceStackView,
                                cryptoLineChartView)
        mainStackView.addAllArrangedSubviews(nameCryptoLabel,
                                             coinImageView)
        changePriceStackView.addAllArrangedSubviews(changePriceImageView,
                                                    changePriceLabel)
    }
    
    func addConstraints() {
        
        addMaskForAllViews(mainView, mainStackView, priceLabel, changePriceStackView, cryptoLineChartView)
        
        mainView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15).isActive = true
        mainView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15).isActive = true
        mainView.topAnchor.constraint(equalTo: topAnchor, constant: 10).isActive = true
        mainView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10).isActive = true

        mainStackView.topAnchor.constraint(equalTo: mainView.topAnchor, constant: 10).isActive = true
        mainStackView.leadingAnchor.constraint(equalTo: mainView.leadingAnchor, constant: 15).isActive = true
        mainStackView.trailingAnchor.constraint(equalTo: mainView.trailingAnchor, constant: -15).isActive = true

        priceLabel.topAnchor.constraint(equalTo: mainStackView.bottomAnchor, constant: 10).isActive = true
        priceLabel.leadingAnchor.constraint(equalTo: mainView.leadingAnchor, constant: 15).isActive = true
        
        coinImageView.widthAnchor.constraint(equalToConstant: 30).isActive = true
        coinImageView.heightAnchor.constraint(equalTo: coinImageView.widthAnchor).isActive = true

        changePriceStackView.topAnchor.constraint(equalTo: priceLabel.bottomAnchor, constant: 10).isActive = true
        changePriceStackView.leadingAnchor.constraint(equalTo: mainView.leadingAnchor, constant: 15).isActive = true
        changePriceStackView.widthAnchor.constraint(equalTo: mainView.widthAnchor, multiplier: 0.5).isActive = true

        cryptoLineChartView.topAnchor.constraint(equalTo: changePriceStackView.bottomAnchor, constant: 5).isActive = true
        cryptoLineChartView.leadingAnchor.constraint(equalTo: mainView.leadingAnchor, constant: 5).isActive = true
        cryptoLineChartView.widthAnchor.constraint(equalTo: mainView.widthAnchor, multiplier: 0.5).isActive = true
//        cryptoLineChartView.heightAnchor.constraint(equalToConstant: 40).isActive = true
        cryptoLineChartView.bottomAnchor.constraint(equalTo: mainView.bottomAnchor, constant: -5).isActive = true
        
        changePriceImageView.widthAnchor.constraint(equalToConstant: 20).isActive = true
        changePriceImageView.heightAnchor.constraint(equalToConstant: 20).isActive = true
    }
    
    func configure() {
        mainView.layer.cornerRadius = 15
        mainView.backgroundColor = .yellow
        
        mainStackView.alignment = .center
        
        nameCryptoLabel.font = .montserrat(30, .bold)
        nameCryptoLabel.numberOfLines = 2
        
        changePriceLabel.font = .montserrat(15, .regular)
        changePriceLabel.textColor = .black
        changePriceImageView.tintColor = .systemGreen
        
        priceLabel.font = .montserrat(30, .bold)
        
        coinImageView.layer.cornerRadius = coinImageView.frame.size.width / 2
        coinImageView.clipsToBounds = true
        coinImageView.contentMode = .scaleAspectFill
        
        cryptoLineChartView.clipsToBounds = true
        cryptoLineChartView.isUserInteractionEnabled = false
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
