import UIKit

final class PreferencesView: UIView {
    
    private let darkmodeSwitch = UISwitch()
    private let languageLabel = UILabel()
    private let darkmodeLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubviews()
        addConstraints()
        configureAppearance()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

private extension PreferencesView {
    
    func addSubviews() {
        addSubviewsAndMask(darkmodeLabel,
                           darkmodeSwitch,
                           languageLabel)
    }
    
    func addConstraints() {
        languageLabel.topAnchor.constraint(equalTo: topAnchor, constant: 10).isActive = true
        languageLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10).isActive = true
        
        darkmodeLabel.topAnchor.constraint(equalTo: languageLabel.bottomAnchor, constant: 20).isActive = true
        darkmodeLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10).isActive = true
        
        darkmodeSwitch.centerYAnchor.constraint(equalTo: darkmodeLabel.centerYAnchor, constant: -3).isActive = true
        darkmodeSwitch.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -30).isActive = true
    }
    
    func configureAppearance() {
        backgroundColor = .white
        languageLabel.font = .montserrat(15, .medium)
        languageLabel.addImageInText(systemImage: Resources.Images.languageImage!, text: "  Language")
        darkmodeLabel.font = .montserrat(15, .medium)
        darkmodeLabel.addImageInText(systemImage: Resources.Images.colormodeImage!, text: "  Dark Mode")
    }
}
