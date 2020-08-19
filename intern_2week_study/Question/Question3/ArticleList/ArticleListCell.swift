import Nuke
import UIKit

class ArticleListCell: UITableViewCell {
    @IBOutlet weak var userImageView: UIImageView!
    @IBOutlet weak var titleTextLabel: UILabel!
    @IBOutlet weak var userNameTextLabel: UILabel!
    @IBOutlet weak var tagsTextLabel: UILabel!
    
    public func setArea(_ article: Article) {
        titleTextLabel.text = article.title
        userNameTextLabel.text = article.user?.name
        
        tagsTextLabel.text = "Tags: "
        for tag in article.tags {
            tagsTextLabel.text? += String(tag.name) + " "
        }

        if let urlString = article.user?.profileImageUrl,
            let url = URL(string: urlString) {
            Nuke.loadImage(with: url, into: userImageView)
        }
    }
}
