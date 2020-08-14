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
            DispatchQueue.main.sync {
                switch result {
                case .success(let articles):
                    self?.showSampleArticleListScreen(articles)
                    
                case .failure(let error):
                    let alert = UIAlertController.createErrorAlert(error)
                    self?.present(alert, animated: true)
                    
                }
                self?.searchButton.isEnabled = true
            }
        }
    }

    private func showSampleArticleListScreen(_ articles: [Article]) {
        let sampleArticleListViewController = SampleArticleListViewController.makeInstance(articles)
        navigationController?.pushViewController(sampleArticleListViewController, animated: true)
    }
    
}
