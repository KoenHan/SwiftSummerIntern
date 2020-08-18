import Nuke
import UIKit

class ArticleListCell: UITableViewCell {
    @IBOutlet weak var titleTextLabel: UILabel!
    @IBOutlet weak var discriptionTextLabel: UILabel!
    @IBOutlet weak var userImageView: UIImageView!
    
    public func set(_ article: Article) {
        print("qwertyuiop")
        print(article.title)
        print(article.likesCount)
        titleTextLabel.text = article.title
        discriptionTextLabel.text = "LGTM: " +  String(article.likesCount)
        
        if let urlString = article.user?.profileImageUrl,
            let url = URL(string: urlString) {
            print(url)
            Nuke.loadImage(with: url, into: userImageView)
        }
    }
}
