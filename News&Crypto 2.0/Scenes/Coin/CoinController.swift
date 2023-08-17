import UIKit
import UILib

protocol CoinControllerViewModel {
    var cryptolineChart: CryptoLineChartView.ChartViewModel { get }
    var currentPrice: String { get }
    var priceChangePercantage24h: String { get }
    var marketCapitalization: String { get }
    var rank: String { get }
    var volume: String { get }
    var marketCapChangePercentage24h: String { get }
    var coinName: String { get }
}

final class CoinViewController: UIViewController {
    
    enum Constants {
        static let scrollViewLeadingInset: CGFloat = 10
        static let scrollViewTrailingInset: CGFloat = -10
        
        static let mainStackViewTopInset: CGFloat = 10
        static let mainStackViewBottomInset: CGFloat = -10
        static let mainStackViewHeightSize: CGFloat = 500
        
        static let chartViewHeightSize: CGFloat = 250
    }
    
    public lazy var walletButton: UIButton = {
        let walletButton = UIButton()
        walletButton.setTitle("+ Wallet", for: .normal)
        walletButton.setTitleColor(.black, for: .normal)
        walletButton.addTarget(self, action: #selector(saveCoin), for: .touchUpInside)
        return walletButton
    }()
    
    // MARK: Private
    private lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.showsVerticalScrollIndicator = false
        return scrollView
    }()
    
    private lazy var mainStackView: UIStackView = {
        let mainStackView = UIStackView()
        mainStackView.translatesAutoresizingMaskIntoConstraints = false
        mainStackView.axis = .vertical
        mainStackView.distribution = .fillProportionally
        mainStackView.alignment = .fill
        mainStackView.spacing = 20
        return mainStackView
    }()
    
    private lazy var chartView: CryptoLineChartView = {
        let chartView = CryptoLineChartView()
        chartView.translatesAutoresizingMaskIntoConstraints = false
        chartView.layer.cornerRadius = 20
        chartView.clipsToBounds = true
        chartView.isUserInteractionEnabled = true
        return chartView
    }()
    
    private lazy var overviewAndWalletButtonStackView: UIStackView = {
        let overviewAndWalletButtonStackView = UIStackView()
        return overviewAndWalletButtonStackView
    }()
    
    private lazy var overviewLabel: UILabel = {
        let overviewLabel = UILabel()
        overviewLabel.text = "Overview"
//        overviewLabel.font = .montserrat(30, .bold)
        return overviewLabel
    }()
    
    private lazy var capitalizationStackView: CapitalizationStackView = {
        let capitalizationStackView = CapitalizationStackView()
        return capitalizationStackView
    }()
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        drawSelf()
        addSetups()
    }
    
    func set(viewModel: CoinControllerViewModel) {
        let changeMarketColor = Double(viewModel.marketCapChangePercentage24h) ?? 0.0 < 0.0
        capitalizationStackView.setCapitalizationLabel(viewModel.marketCapitalization,
                                                       viewModel.marketCapChangePercentage24h + "%",
                                                       changeMarketColor ? .systemRed : .systemGreen)
        let changeColor = Double(viewModel.priceChangePercantage24h) ?? 0.0 < 0
        capitalizationStackView.setCurrentPriceLabel(viewModel.currentPrice,
                                                     viewModel.priceChangePercantage24h + "%",
                                                     changeColor ? .systemRed : .systemGreen)
        capitalizationStackView.setRankLabel(viewModel.rank)
        capitalizationStackView.setVolumeLabel(viewModel.volume)
        title = viewModel.coinName
        chartView.configure(viewModel: viewModel.cryptolineChart)
    }
}

private extension CoinViewController {
    
    func drawSelf() {
        view.addSubviewsAndMask(scrollView)
        scrollView.addSubview(mainStackView)
        mainStackView.addAllArrangedSubviews(chartView,
                                          overviewAndWalletButtonStackView,
                                          capitalizationStackView)
        overviewAndWalletButtonStackView.addAllArrangedSubviews(overviewLabel,
                                                             walletButton)
        
        let scrollViewConstraints = self.setScrollViewConstraints()
        let chartView = self.setChartViewConstraints()
        let mainStackView = self.setMainStackViewConstraints()
        
        NSLayoutConstraint.activate(scrollViewConstraints +
                                    chartView +
                                    mainStackView)
    }
    
    func setScrollViewConstraints() -> [NSLayoutConstraint] {
        let topAnchor = scrollView.topAnchor.constraint(equalTo: view.topAnchor)
        let leadingAnchor = scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: Constants.scrollViewLeadingInset)
        let trailingAnchor = scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: Constants.scrollViewTrailingInset)
        let bottomAnchor = scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        return [
            topAnchor,
            leadingAnchor,
            trailingAnchor,
            bottomAnchor
        ]
    }
    
    func setChartViewConstraints() -> [NSLayoutConstraint] {
        let heightAnchor = chartView.heightAnchor.constraint(equalToConstant: Constants.chartViewHeightSize)
        return [heightAnchor]
    }
    
    func setMainStackViewConstraints() -> [NSLayoutConstraint] {
        let topAnchor = mainStackView.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: Constants.mainStackViewTopInset)
        let bottomAnchor = mainStackView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: Constants.mainStackViewBottomInset)
        let widthAnchor = mainStackView.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 1)
        let heightAnchor = mainStackView.heightAnchor.constraint(equalToConstant: Constants.mainStackViewHeightSize)
        return [
            topAnchor,
            bottomAnchor,
            widthAnchor,
            heightAnchor
        ]
    }
    
    func addSetups() {
        addViewSetups()
        addNavigationSetups()
    }
    
    func addViewSetups() {
        view.backgroundColor = .systemBackground
    }
    
    func addNavigationSetups() {
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .close, target: self, action: #selector(didTapClose))
    }
    
    func showResultAlert(_ companyName: String) {
        let alert = UIAlertController(title: "Added to WatchList", message: "We've added \(companyName) to your watchlist.", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Dismiss", style: .cancel, handler: nil))
        present(alert, animated: true)
    }
    
    // MARK: - Actions
    
    // MARK: Private
    
    @objc func didTapClose() {
        dismiss(animated: true)
    }
    
    @objc func saveCoin() {

    }
}
