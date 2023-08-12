import UIKit
import SafariServices

protocol NewsViewProtocol: AnyObject {
    func displayData(viewModel: News.Model.ViewModel.ViewModelData)
}

final class NewsViewController: UIViewController {
    
    var interactor: NewsInteractorProtocol?
    var router: (NSObjectProtocol & NewsRouterProtocol)?
    //    private let tableView = UITableView()
    private var newsViewModel = NewsViewModel(model: []) {
        didSet {
            tableView.reloadData()
        }
    }
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(NewsTableViewCell.self, forCellReuseIdentifier: NewsTableViewCell.identifier)
        tableView.delegate = self
        tableView.dataSource = self
        return tableView
    }()

    // MARK: View lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureAppearance()
        interactor?.makeRequest(request: News.Model.Request.RequestType.getNews)
    }
}

private extension NewsViewController {
    
    func configureAppearance() {
        view.addSubview(tableView)
        tableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
    }
    
    func open(url: URL) {
        let vc = SFSafariViewController(url: url)
        present(vc, animated: true)
    }
    
    func presentFailedOpenAlert() {
        let alert = UIAlertController(
            title: "Unable to Open",
            message: "We were unable to open the article",
            preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Dismiss", style: .cancel))
        present(alert, animated: true)
    }
    
}

extension NewsViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        newsViewModel.model.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: NewsTableViewCell.identifier,
                                                       for: indexPath) as? NewsTableViewCell else { return UITableViewCell ()}
        let model = newsViewModel.model[indexPath.row]
        // dump(indexPath)
        cell.set(viewModel: model)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let story = newsViewModel.models[indexPath.row]
        guard let url = URL(string: story.url) else {
            presentFailedOpenAlert()
            return
        }
        open(url: url)
    }
}

extension NewsViewController: NewsViewProtocol {
    func displayData(viewModel: News.Model.ViewModel.ViewModelData) {
        switch viewModel {
            
        case .displayNews(newsViewModel: let newsViewModel):
            self.newsViewModel = newsViewModel
        }
    }
}
