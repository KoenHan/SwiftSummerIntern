import UIKit

final class Question1ViewController: UIViewController {
    
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var addTextButton: UIButton!
    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var clearTextButton: UIButton!
    @IBOutlet weak var textWarning: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textField.text = ""
        textView.text = ""
        textWarning.isHidden = true
    }
    
    @IBAction func addText(_ sender: Any) {
        guard let textFieldValue = textField.text else {
            return
        }
        if textFieldValue == "" {
            textWarning.isHidden = false
        } else {
            textWarning.isHidden = true
            textView.text += textFieldValue + "\n"
            textField.text = ""
        }
    }
    
    @IBAction func clearText(_ sender: Any) {
        textView.text = ""
    }
}
