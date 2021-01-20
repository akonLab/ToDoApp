import UIKit

class AddViewController: UIViewController,UITextFieldDelegate {
     
    @IBOutlet weak var saveBtn: UIButton!
    @IBOutlet weak var dedlineField: UITextField!
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var titleField: UITextField!

    var delegate: SecondViewControllerDelegate?
    var id = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        dedlineField.delegate=self
        titleField.delegate=self
        textField.delegate=self
    }
    
    func textFieldShouldReturn(_ textField:UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    @IBAction func save(_ sender: Any)  { 

        let title=titleField.text
        let date = dedlineField.text
        let desc=textField.text
        
        let newTask=ToDoItem(id: id,
                             title: title,
                             desc: desc,
                             dedline:date )
        
        delegate?.addTask(newTask)
        
        navigationController?.popViewController(animated: true)
        //go to prev page
    }
    
    
    
}
