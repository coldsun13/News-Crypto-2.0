import UIKit
import Kingfisher

protocol NewsCellViewModel {
    var image: String { get }
    var headline: String { get }
    var source: String { get }
    var date: String { get }
    var url: String { get }
}

final class NewsTableViewCell: UITableViewCell {
    // MARK: - Identifier
    
    static let identifier = "NewsTableViewCell"
    
    enum Constants {
        static let newsViewTopInset: CGFloat = 10
        static let newsViewLeadingInset: CGFloat = 10
        static let newsViewTrailingInset: CGFloat = -10
        static let newsViewBottomInset: CGFloat = -10
        
        static let mainStackViewTopInset: CGFloat = 5
        static let mainStackViewLeadingInset: CGFloat = 15
        static let mainStackViewTrailingInset: CGFloat = -15
        static let mainStackViewBottomInset: CGFloat = -5
        
        static let newsImageViewHeightSize: CGFloat = 70
        static let newsImageViewWidthSize: CGFloat = 70
    }
    // MARK: Private
    
    private lazy var newsView: UIView = {
       let newsView = UIView()
        newsView.translatesAutoresizingMaskIntoConstraints = false
        newsView.layer.cornerRadius = 20
        newsView.backgroundColor = .white
        newsView.addShadow()
        
        return newsView
    }()
    
    private lazy var mainStackView: UIStackView = {
       let mainStackView = UIStackView()
        mainStackView.translatesAutoresizingMaskIntoConstraints = false
        mainStackView.axis = .horizontal
        mainStackView.distribution = .fillProportionally
        mainStackView.alignment = .center
        mainStackView.spacing = 20
        
        return mainStackView
    }()
    
    private lazy var newsImageView: WebImageView = {
       let newsImageView = WebImageView()
        newsImageView.translatesAutoresizingMaskIntoConstraints = false
        newsImageView.layer.cornerRadius = 10
        newsImageView.clipsToBounds = true
        newsImageView.contentMode = .scaleAspectFill
        return newsImageView
    }()
    
    private lazy var infoStackView: UIStackView = {
       let infoStackView = UIStackView()
        infoStackView.axis = .vertical
        infoStackView.distribution = .fillProportionally
        infoStackView.alignment = .fill
        infoStackView.spacing = 10
        return infoStackView
    }()
    
    private lazy var titleLabel: UILabel = {
        let titleLabel = UILabel()
//        titleLabel.font = .montserrat(17, .medium)
        titleLabel.numberOfLines = 2
        return titleLabel
    }()
    
    private lazy var sourceAndDateLabel: UILabel = {
        let sourceAndDateLabel = UILabel()
//        sourceAndDateLabel.font = .montserrat(15, .medium)
        sourceAndDateLabel.textColor = .gray
        return sourceAndDateLabel
    }()
    
    // MARK: - Lifecycle
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        drawSelf()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - API
    
    func set(viewModel: NewsCellViewModel) {
        newsImageView.kf.setImage(with: URL(string: viewModel.image))
        titleLabel.text = viewModel.headline
        sourceAndDateLabel.text = viewModel.source + " • " + viewModel.date
    }
}

private extension NewsTableViewCell {
    
    func drawSelf() {
        contentView.addSubview(newsView)
        newsView.addSubview(mainStackView)
        mainStackView.addAllArrangedSubviews(newsImageView,
                                             infoStackView)
        infoStackView.addAllArrangedSubviews(titleLabel,
                                             sourceAndDateLabel)
        let newsViewConstraints = self.setNewsViewConstraints()
        let mainStackViewConstraints = self.setMainStackViewConstraints()
        let newsImageViewConstraints = self.setNewsImageViewConstraints()
        
        NSLayoutConstraint.activate(newsViewConstraints +
                                    mainStackViewConstraints +
                                    newsImageViewConstraints)
    }
    
    func setNewsViewConstraints() -> [NSLayoutConstraint] {
        let topAnchor = newsView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: Constants.newsViewTopInset)
        let leadingAnchor = newsView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: Constants.newsViewLeadingInset)
        let trailingAnchor = newsView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: Constants.newsViewTrailingInset)
        let bottomAnchor = newsView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: Constants.newsViewBottomInset)
        return [topAnchor,
                leadingAnchor,
                trailingAnchor,
                bottomAnchor]
    }
    
    func setMainStackViewConstraints() -> [NSLayoutConstraint] {
        let topAnchor = mainStackView.topAnchor.constraint(equalTo: newsView.topAnchor, constant: Constants.mainStackViewTopInset)
        let leadingAnchor = mainStackView.leadingAnchor.constraint(equalTo: newsView.leadingAnchor, constant: Constants.mainStackViewLeadingInset)
        let trailingAnchor = mainStackView.trailingAnchor.constraint(equalTo: newsView.trailingAnchor, constant: Constants.mainStackViewTrailingInset)
        let bottomAnchor = mainStackView.bottomAnchor.constraint(equalTo: newsView.bottomAnchor, constant: Constants.mainStackViewBottomInset)
        return [topAnchor,
                leadingAnchor,
                trailingAnchor,
                bottomAnchor]
    }
    
    func setNewsImageViewConstraints() -> [NSLayoutConstraint] {
        let widht = newsImageView.widthAnchor.constraint(equalToConstant: Constants.newsImageViewWidthSize)
        let height = newsImageView.heightAnchor.constraint(equalToConstant: Constants.newsImageViewHeightSize)
        return [widht,
                height]
    }
}

