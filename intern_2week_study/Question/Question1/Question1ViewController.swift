import UIKit

final class Question1ViewController: UIViewController {
    
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var addTextButton: UIButton!
    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var clearTextButton: UIButton!
    @IBOutlet weak var warningLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textField.text = ""
        textView.text = ""
        warningLabel.isHidden = true
    }
    
    @IBAction func addText(_ sender: Any) {
        guard let inputText = textField.text else { return }
        guard !inputText.isEmpty else {
            warningLabel.isHidden = false
            return
        }
        warningLabel.isHidden = true
        textView.text += inputText + "\n"
        textField.text = ""
    }
    
    @IBAction func clearText(_ sender: Any) {
        textView.text = ""
    }
}
