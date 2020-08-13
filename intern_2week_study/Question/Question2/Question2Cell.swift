import Nuke
import UIKit

class Question2Cell: UITableViewCell {
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var areaImageView: UIImageView!
    
    func setCellImage(_ label: String, _ url: URL) {
        self.label.text = label
        Nuke.loadImage(with: url, into: areaImageView)
    }
}
