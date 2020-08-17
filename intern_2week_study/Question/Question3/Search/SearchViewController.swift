import UIKit

final class SearchViewController: UIViewController {
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var searchButton: UIButton!
    
    @IBAction func searchButtonTapped(_ sender: UIButton) {
        searchArticles()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    private func searchArticles() {
        searchButton.isEnabled = false
        
        guard let text = textField.text, !text.isEmpty else { return }
        
        APIClient.fetchArticles(keyword: text) { [weak self] result in
            guard let self = self else { return }
            DispatchQueue.main.sync {
                switch result {
                case .success(let articles):
                    self.showArticleListScreen(articles)
                case .failure(let error):
                    let alert = UIAlertController.createErrorAlert(error)
                    self.present(alert, animated: true)
                }
                self.searchButton.isEnabled = true
            }
        }
    }

    private func showArticleListScreen(_ articles: [Article]) {
        print(articles)
//        let articleListViewController = ArticleListViewController.makeInstance(articles)
//        navigationController?.pushViewController(articleListViewController, animated: true)
    }
    
}
