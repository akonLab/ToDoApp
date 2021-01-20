import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var textFieldEmail: UITextField!
    @IBOutlet weak var TextFieldPassword: UITextField!
    @IBOutlet weak var signInBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }


    @IBAction func signIn(_ sender: UIButton) {
        let vc=storyboard?.instantiateViewController(identifier: "SecondViewController")as! SecondViewController
        
        navigationController?.pushViewController(vc, animated: true)
    }
}

