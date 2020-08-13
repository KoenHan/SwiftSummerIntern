import Nuke
import UIKit

final class Question2ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    private let areaTexts: [String] = ["茨城県", "栃木県", "群馬県", "埼玉県", "千葉県", "東京都", "神奈川県"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension Question2ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // TableViewに表示する行数を指定する
        return areaTexts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = UITableViewCell(style: .default, reuseIdentifier: "cell")
        let cell: UITableViewCell = Question2Cell()

        cell.textLabel?.text = areaTexts[indexPath.row]
        let url = URL(string: "https://www.irasutoya.com/2017/03/blog-post_72.html")!
        Nuke.loadImage(with: url, into: cell.imageView!)
        return cell
    }
}
