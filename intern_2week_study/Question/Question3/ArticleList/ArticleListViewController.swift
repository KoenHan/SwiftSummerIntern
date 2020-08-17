import UIKit

final class ArticleListViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    private let areaTexts: [String] = ["茨城県", "栃木県", "群馬県", "埼玉県", "千葉県", "東京都", "神奈川県"]
    
    private let areaImageUrlStrings: [String] = [
        "https://1.bp.blogspot.com/-xzTdHATFuvU/Xlyft6FdB2I/AAAAAAABXoY/-MCfnzSXVhkg0WDObHDVFbkvmUGVUoN0QCNcBGAsYHQ/s180-c/food_ra-men_lemon.png",
        "https://3.bp.blogspot.com/-ulAra8ZoOxY/WKbKazk0oQI/AAAAAAABB04/IWAtU-oO-h47by4cJC7I0GUloJRqtx2SQCLcB/s400/food_aburasoba.png",
        "https://1.bp.blogspot.com/-AC1sM6NFLDg/XkZc3TcZh8I/AAAAAAABXQs/bBqpyDU0FTMpN5094w5pBwenw3Q96s4mgCNcBGAsYHQ/s180-c/food_ramen_gekikara.png",
        "https://1.bp.blogspot.com/-PnyYmzw1H2M/Xbz2u2SOSyI/AAAAAAABV80/Tfc9-k70FpkEAWhTGBo8ka16dvbNIR6tQCNcBGAsYHQ/s180-c/food_rakusa_laksa_ra-men.png",
        "https://1.bp.blogspot.com/-XHNyzCDPEbc/XXRbE5q7V_I/AAAAAAABUrg/FOtz7Xxl2qoBnCeIN5j5IPc8NPlIWYuBQCLcBGAs/s180-c/ramen_taiwan.png",
        "https://3.bp.blogspot.com/-SPxxmVTDKHY/XDXbhQqyFXI/AAAAAAABRA0/60DaQxi-zN4_EE6ECxew6hLSCfMq1Ur8gCLcBGAs/s180-c/food_ramen_tomyamkung.png",
        "https://2.bp.blogspot.com/-Im1V2I6h-ZM/W5H_zG9IHYI/AAAAAAABOvs/NBNcZ2ZJRiQ7YsZW3yX0C7Z4Vog0M0WBQCLcBGAs/s180-c/food_ra-men_tanmen.png"
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(R.nib.articleListCell)
    }
    
    public func makeInstance(_ articles: [Article]){
        return
    }
}

extension ArticleListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // TableViewに表示する行数を指定する
        return areaTexts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard
            let cell = tableView.dequeueReusableCell(withIdentifier: R.reuseIdentifier.articleListCell, for: indexPath),
            let name = areaTexts[safe: indexPath.row],
            let url = URL(string: areaImageUrlStrings[indexPath.row])
            else { return UITableViewCell() }
        cell.setArea(name, url)
        return cell
    }
}

extension ArticleListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let name = areaTexts[safe: indexPath.row] else { return }
        let alertController: UIAlertController = UIAlertController(
                    title: name,
                    message: "今\(name)を選びましたね．",
                    preferredStyle: .alert)

        let alertAction = UIAlertAction(title: "OK", style: .default)
        alertController.addAction(alertAction)
        
        present(alertController, animated: true)
    }
}
