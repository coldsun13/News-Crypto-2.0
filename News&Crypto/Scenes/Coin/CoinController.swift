import UIKit

protocol CoinViewModelProtocol: AnyObject {
    func viewModel()
}

final class CoinController: UIViewController {
    
    var interactor: CoinInteractorProtocol?
    var router`: CoinRouterProtocol?
    
    private lazy var button: UIButton = {
        let mybutton = UIButton()
        mybutton.translatesAutoresizingMaskIntoConstraints = false
        mybutton.setTitle("нажать", for: .normal)
        mybutton.addTarget(self, action: #selector(action), for: .touchUpInside)
        return mybutton
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        appearance()
    }

    @objc func action() {
        print("нажата кнопка")
        interactor?.fetchTap()
    }
}

extension CoinController {
    func appearance() {
        view.addSubview(button)
        let constraints = setupButtonConstraints()
        NSLayoutConstraint.activate(constraints)
    }
    
    func setupButtonConstraints() -> [NSLayoutConstraint] {
        let centerX = button.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        let centerY = button.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        return [centerX, centerY]
    }
}

extension CoinController: CoinViewModelProtocol {
    func viewModel() {
        print("контроллер")
    }
}
