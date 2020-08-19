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
        setSearchButtonDesign()
    }

    private func searchArticles() {
        warningLabel.isHidden = true
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
    
    private func setSearchButtonDesign() {
        searchButton.backgroundColor = UIColor(red: 0.2, green: 0.6, blue: 1.0, alpha: 1.0)
        searchButton.setTitleColor(UIColor.white, for: UIControl.State.normal)
        searchButton.layer.cornerRadius = 10
        searchButton.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.25).cgColor
        searchButton.layer.shadowOffset = CGSize(width: 0.0, height: 2.0)
        searchButton.layer.shadowOpacity = 1.0
        searchButton.layer.shadowRadius = 0.0
    }
    
    @IBAction func pushSearchButton(_ sender: Any) {
        searchButton.backgroundColor = UIColor(red: 0.137, green: 0.576, blue: 0.976, alpha: 1.0)
        searchButton.setTitleColor(UIColor.white, for: UIControl.State.normal)
        searchButton.layer.cornerRadius = 10
        searchButton.layer.shadowOffset = CGSize(width: 0.0, height: 0.0)
        searchButton.layer.shadowOpacity = 0.0
    }
    
    @IBAction func releaseSearchButton(_ sender: Any) {
        setSearchButtonDesign()
        
    }
}
