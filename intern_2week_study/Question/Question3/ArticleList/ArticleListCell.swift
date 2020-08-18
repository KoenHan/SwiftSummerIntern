import Nuke
import UIKit

class ArticleListCell: UITableViewCell {
    @IBOutlet weak var userImageView: UIImageView!
    @IBOutlet weak var titleTextLabel: UILabel!
    @IBOutlet weak var discriptionTextLabel: UILabel!
    
    public func setArea(_ article: Article) {
        titleTextLabel.text = article.title
        discriptionTextLabel.text = "LGTM: " +  String(article.likesCount)
        
        if let urlString = article.user?.profileImageUrl,
            let url = URL(string: urlString) {
            Nuke.loadImage(with: url, into: userImageView)
        }
    }
}
