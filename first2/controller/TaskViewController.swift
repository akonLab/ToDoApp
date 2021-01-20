import UIKit

class TaskViewController: UIViewController {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    
    var id=0
    var task:ToDoItem?
    var delegate: SecondViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        titleLabel.text=task?.title
        dateLabel.text=task?.dedline
        descLabel.text=task?.desc

    }
}
