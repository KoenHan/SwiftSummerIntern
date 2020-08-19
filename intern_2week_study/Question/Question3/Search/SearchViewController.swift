import UIKit

final class SearchViewController: UIViewController {
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var searchButton: UIButton!
    @IBOutlet weak var warningLabel: UILabel!
    
    @IBAction func searchButtonTapped(_ sender: UIButton) {
        searchArticles()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        warningLabel.isHidden = true
    }

    private func searchArticles() {
        searchButton.isEnabled = false
        
        guard let text = textField.text, !text.isEmpty else {
            warningLabel.isHidden = false
            searchButton.isEnabled = true
            return
        }
        
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
        let articleListViewController = SampleArticleListViewController.makeInstance(articles)
        navigationController?.pushViewController(articleListViewController, animated: true)
    }
    
}
