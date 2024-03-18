import UIKit
import UILib
import Lottie

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

protocol CoinViewModelProtocol: AnyObject {
    func viewModel()
}

final class CoinController: UIViewController {
    
     var lottieView = LottieAnimationView()
    
    var interactor: CoinInteractorProtocol?
    var router: CoinRouterProtocol?
    
    enum Constants {
        static let scrollViewLeadingInset: CGFloat = 10
        static let scrollViewTrailingInset: CGFloat = -10
        
        static let mainStackViewTopInset: CGFloat = 10
        static let mainStackViewBottomInset: CGFloat = -10
        static let mainStackViewHeightSize: CGFloat = 500
        
        static let chartViewHeightSize: CGFloat = 250
    }
    
    func lottieAnimation(name: String) {
        view.addSubview(lottieView)
        lottieView.translatesAutoresizingMaskIntoConstraints = false
        lottieView.heightAnchor.constraint(equalToConstant: 50).isActive = true
        lottieView.widthAnchor.constraint(equalToConstant: 50).isActive = true 
        lottieView.animation = LottieAnimation.named(name)
        lottieView.loopMode = .playOnce
        lottieView.contentMode = .scaleAspectFill
    }
    
    lazy var walletStackView: UIStackView = {
       var walletStackView = UIStackView()
        walletStackView.translatesAutoresizingMaskIntoConstraints = false
        walletStackView.distribution = .fillProportionally
        walletStackView.spacing = 15
        walletStackView.axis = .horizontal
        return walletStackView
    }()
    
    
    
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
        overviewLabel.font = .montserrat(30, .bold)
        return overviewLabel
    }()
    
    private lazy var capitalizationStackView: CapitalizationStackView = {
        let capitalizationStackView = CapitalizationStackView()
        return capitalizationStackView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        drawSelf()
    }
    
    func fetch(viewModel: CoinControllerViewModel) {
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

private extension CoinController {
    
    func drawSelf() {
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .close, target: self, action: #selector(didTapClose))
        view.backgroundColor = .systemBackground
        view.addSubviewsAndMask(scrollView)
        scrollView.addSubview(mainStackView)
        mainStackView.addAllArrangedSubviews(chartView,
                                             overviewAndWalletButtonStackView,
                                             capitalizationStackView)
        walletStackView.addAllArrangedSubviews(lottieView, walletButton)
        overviewAndWalletButtonStackView.addAllArrangedSubviews(overviewLabel,
                                                                walletStackView)
        
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
    // соболезную тому, кто вот это вот ниже всё писал
    @objc func saveCoin() {
        router?.showResultAler(source: self)
    }
    
    @objc func didTapClose() {
        router?.closeController(source: self)
    }
    
}

extension CoinController: CoinViewModelProtocol {
    func viewModel() {
    }
}