import UIKit

protocol CryptoCellViewModel {
    var price: String { get }
    var name: String { get }
    var abbriviatedName: String { get }
    var changePrice: String { get }
    var cryptolineChart: CryptoLineChartView.ViewModel { get }
    var iconURLString: String { get }
}

final class CryptoCell: UITableViewCell {
    
    static let identifier = "CryptoCell"
    
    private let coinNameStackView = UIStackView()
    private let priceStackView = UIStackView()
    private let coinStackView = UIStackView()
    private let cryptoLineChartView = CryptoLineChartView()
    private let priceLabel = UILabel()
    private let coinImageView = WebImageView()
    private let coinNameLabel = UILabel()
    private let coinAbbriviatedNameLabel = UILabel()
    private let changePriceLabel = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addViews()
        addConstraints()
        configure()
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
        coinImageView.set(imageURL: viewModel.iconURLString)
        priceLabel.text = viewModel.price
        coinNameLabel.text = viewModel.name
        coinAbbriviatedNameLabel.text = viewModel.abbriviatedName
        changePriceLabel.text = viewModel.changePrice
        cryptoLineChartView.configure(viewModel: viewModel.cryptolineChart)
    }
}

private extension CryptoCell {
    
    func addViews() {
        addSubview(coinStackView)
        coinStackView.addAllArrangedSubviews(coinImageView,
                                             coinNameStackView,
                                             cryptoLineChartView,
                                             priceStackView
                                             )
        priceStackView.addAllArrangedSubviews(priceLabel,
                                              changePriceLabel)
        coinNameStackView.addAllArrangedSubviews(coinNameLabel,
                                                 coinAbbriviatedNameLabel)
    }
    
    func addConstraints() {
        coinStackView.translatesAutoresizingMaskIntoConstraints = false
        coinStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10).isActive = true
        coinStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10).isActive = true
        coinStackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10).isActive = true
        coinStackView.topAnchor.constraint(equalTo: topAnchor,constant: 10).isActive = true
        
        coinNameStackView.translatesAutoresizingMaskIntoConstraints = false
        coinNameStackView.widthAnchor.constraint(equalTo: coinStackView.widthAnchor, multiplier: 0.25).isActive = true
        
        coinImageView.translatesAutoresizingMaskIntoConstraints = false
        coinImageView.widthAnchor.constraint(equalToConstant: 30).isActive = true
        coinImageView.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        cryptoLineChartView.translatesAutoresizingMaskIntoConstraints = false
        cryptoLineChartView.widthAnchor.constraint(equalTo: coinStackView.widthAnchor, multiplier: 0.3).isActive = true
        cryptoLineChartView.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
    
    func configure() {
        coinStackView.axis = .horizontal
        coinStackView.distribution = .fillProportionally
        coinStackView.alignment = .center
        coinStackView.spacing = 15
        coinStackView.backgroundColor = .systemBackground
        
        coinNameStackView.axis = .vertical
        coinNameStackView.distribution = .fillProportionally
        coinNameStackView.alignment = .fill
        
        priceStackView.axis = .vertical
        priceStackView.distribution = .fillProportionally
        priceStackView.alignment = .trailing
        
        coinNameLabel.font = .montserrat(17, .medium)
        
        coinAbbriviatedNameLabel.font = .montserrat(15, .regular)
        coinAbbriviatedNameLabel.textColor = .gray
        
        priceLabel.font = .montserrat(16, .medium)
        priceLabel.adjustsFontSizeToFitWidth = true
        priceLabel.minimumScaleFactor = 0.5
        
        changePriceLabel.font = .montserrat(13, .regular)
        
        cryptoLineChartView.clipsToBounds = true
        cryptoLineChartView.isUserInteractionEnabled = false
    }
}
