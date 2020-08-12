import UIKit

final class Question1ViewController: UIViewController {
    
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var addTextButton: UIButton!
    @IBOutlet weak var textView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textField.text = ""
        textView.text = ""
    }
    
    @IBAction func addText(_ sender: Any) {
        guard let textFieldValue = textField.text else {
            return
        }
        textView.text += textFieldValue + "\n"
        textField.text = ""
    }
}
