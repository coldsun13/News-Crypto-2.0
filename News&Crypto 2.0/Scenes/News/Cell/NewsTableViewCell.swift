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
    
    // MARK: - Properties
    
    // MARK: Private
    
//    private let newsView = UIView()
//    private let mainStackView = UIStackView()
//    private let newsImageView = WebImageView()
//    private let infoStackView = UIStackView()
//    private let titleLabel = UILabel()
//    private let sourceAndDateLabel = UILabel()
    
    private lazy var newsView: UIView = {
       let newsView = UIView()
        newsView.layer.cornerRadius = 20
        newsView.backgroundColor = .white
        newsView.addShadow()
        
        return newsView
    }()
    
    private lazy var mainStackView: UIStackView = {
       let mainStackView = UIStackView()
        mainStackView.axis = .horizontal
        mainStackView.distribution = .fillProportionally
        mainStackView.alignment = .center
        mainStackView.spacing = 20
        
        return mainStackView
    }()
    
    private lazy var newsImageView: WebImageView = {
       let newsImageView = WebImageView()
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
        titleLabel.font = .montserrat(17, .medium)
        titleLabel.numberOfLines = 2
        
        return titleLabel
    }()
    
    private lazy var sourceAndDateLabel: UILabel = {
        let sourceAndDateLabel = UILabel()
        sourceAndDateLabel.font = .montserrat(15, .medium)
        sourceAndDateLabel.textColor = .gray

        return sourceAndDateLabel
    }()
    
    // MARK: - Lifecycle
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubviews()
        addConstraints()
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
    
    func addConstraints() {
        addNewsViewConstraints()
        addMainStackViewConstraints()
        addNewsImageViewConstraints()
    }
    
    func addNewsViewConstraints() {
        newsView.translatesAutoresizingMaskIntoConstraints = false
        newsView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10).isActive = true
        newsView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10).isActive = true
        newsView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10).isActive = true
        newsView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10).isActive = true
    }
    
    func addMainStackViewConstraints() {
        mainStackView.translatesAutoresizingMaskIntoConstraints = false
        mainStackView.topAnchor.constraint(equalTo: newsView.topAnchor, constant: 5).isActive = true
        mainStackView.leadingAnchor.constraint(equalTo: newsView.leadingAnchor, constant: 15).isActive = true
        mainStackView.trailingAnchor.constraint(equalTo: newsView.trailingAnchor, constant: -15).isActive = true
        mainStackView.bottomAnchor.constraint(equalTo: newsView.bottomAnchor, constant: -5).isActive = true
    }
    
    func addNewsImageViewConstraints() {
        newsImageView.translatesAutoresizingMaskIntoConstraints = false
        newsImageView.widthAnchor.constraint(equalToConstant: 70).isActive = true
        newsImageView.heightAnchor.constraint(equalToConstant: 70).isActive = true
    }
    
    // MARK: - Setups
    
    // MARK: Private
    
    func addSubviews() {
        contentView.addSubview(newsView)
        newsView.addSubview(mainStackView)
        mainStackView.addAllArrangedSubviews(newsImageView,
                                             infoStackView)
        infoStackView.addAllArrangedSubviews(titleLabel,
                                             sourceAndDateLabel)
    }
    
//    func addSetups() {
//        addContentViewSetups()
//        addNewsViewSetups()
//        addMainStackViewSetups()
//        addInfoStackSetups()
//        addNewsImageViewSetups()
//        addTitleLabelSetups()
//        addSourceAndDateLabelSetups()
//    }
//
//    func addContentViewSetups() {
//        contentView.backgroundColor = .white
//    }
//
//    func addNewsViewSetups() {
//        newsView.layer.cornerRadius = 20
//        newsView.backgroundColor = .white
//        newsView.addShadow()
//    }
//
//    func addMainStackViewSetups() {
//        mainStackView.axis = .horizontal
//        mainStackView.distribution = .fillProportionally
//        mainStackView.alignment = .center
//        mainStackView.spacing = 20
//    }
//
//    func addInfoStackSetups() {
//        infoStackView.axis = .vertical
//        infoStackView.distribution = .fillProportionally
//        infoStackView.alignment = .fill
//        infoStackView.spacing = 10
//    }
//
//    func addNewsImageViewSetups() {
//        newsImageView.layer.cornerRadius = 10
//        newsImageView.clipsToBounds = true
//        newsImageView.contentMode = .scaleAspectFill
//    }
//
//    func addTitleLabelSetups() {
//        titleLabel.font = .montserrat(17, .medium)
//        titleLabel.numberOfLines = 2
//    }
//
//    func addSourceAndDateLabelSetups() {
//        sourceAndDateLabel.font = .montserrat(15, .medium)
//        sourceAndDateLabel.textColor = .gray
//    }
}

