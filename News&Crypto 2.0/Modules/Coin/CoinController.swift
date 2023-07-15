import UIKit

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
    
    public let walletButton = UIButton()
    
    // MARK: Private
    
    private let scrollView = UIScrollView()
    private let mainStackView = UIStackView()
    private let chartView = CryptoLineChartView()
    private let overviewAndWalletButtonStackView = UIStackView()
    private let overviewLabel = UILabel()
    private let capitalizationStackView = CapitalizationStackView()
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addSubviews()
        addSetups()
        addContraints()
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
    
    func addContraints() {
        addScrollViewConstraints()
        addMainStackViewConstraints()
        addChartConstraints()
    }
    
    func addScrollViewConstraints() {
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10).isActive = true
        scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }
    
    func addChartConstraints() {
        chartView.translatesAutoresizingMaskIntoConstraints = false
        chartView.heightAnchor.constraint(equalToConstant: 250).isActive = true
    }
    
    func addMainStackViewConstraints() {
        mainStackView.translatesAutoresizingMaskIntoConstraints = false
        mainStackView.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 10).isActive = true
        mainStackView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: -10).isActive = true
        mainStackView.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 1).isActive = true
        mainStackView.heightAnchor.constraint(equalToConstant: 500).isActive = true
    }
    
    func addSubviews() {
        view.addSubviewsAndMask(scrollView)
        scrollView.addSubview(mainStackView)
        mainStackView.addAllArrangedSubviews(chartView,
                                          overviewAndWalletButtonStackView,
                                          capitalizationStackView)
        overviewAndWalletButtonStackView.addAllArrangedSubviews(overviewLabel,
                                                             walletButton)
    }
    
    func addSetups() {
        addMainStackViewSetups()
        addViewSetups()
        addNavigationSetups()
        addChartSetups()
        addOverviewLabelSetups()
        addWalletButtonSetups()
    }
    
    func addMainStackViewSetups() {
        mainStackView.axis = .vertical
        mainStackView.distribution = .fillProportionally
        mainStackView.alignment = .fill
        mainStackView.spacing = 20
        scrollView.showsVerticalScrollIndicator = false
    }
    
    func addChartSetups() {
        chartView.layer.cornerRadius = 20
        chartView.clipsToBounds = true
        chartView.isUserInteractionEnabled = true
    }
    
    func addOverviewLabelSetups() {
        overviewLabel.text = "Overview"
        overviewLabel.font = .montserrat(30, .bold)
    }
    
    func addWalletButtonSetups() {
        walletButton.setTitle("+ Wallet", for: .normal)
        walletButton.setTitleColor(.black, for: .normal)
        walletButton.addTarget(self, action: #selector(saveCoin), for: .touchUpInside)
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
