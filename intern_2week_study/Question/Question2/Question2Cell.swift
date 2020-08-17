import Nuke
import UIKit

class Question2Cell: UITableViewCell {
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var areaImageView: UIImageView!
    
    public func setArea(_ name: String, _ withImageURL: URL) {
        self.label.text = name
        Nuke.loadImage(with: withImageURL, into: areaImageView)
    }
}
