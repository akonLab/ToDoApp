import UIKit

class EditViewController: UIViewController {
    var task:ToDoItem?
    
    @IBOutlet weak var titleField: UITextField!
    @IBOutlet weak var dedlineField: UITextField!
    @IBOutlet weak var descField: UITextField!
    @IBOutlet weak var editBtn: UIButton!
    
    var delegate: SecondViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func editBtnTap(_ sender: Any) {
        let editTask=ToDoItem(id: task?.id,
                              title: titleField.text,
                              desc: descField.text,
                              dedline: dedlineField.text)
     
        delegate?.editItem(editTask)
        
        navigationController?.popViewController(animated: true)
        //go to prev page
    }
    
}
