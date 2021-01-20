import UIKit

class TableViewCell: UITableViewCell {
    
    @IBOutlet weak var titleBtn: UIButton!
    @IBOutlet weak var editBtn: UIButton!
    @IBOutlet weak var removeBtn: UIButton!
    
    var id=0
    var task:ToDoItem?
    var delegate: SecondViewControllerDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    var editCallback: ((_ item:ToDoItem) -> Void)?
    var removeCallback: ((_ id: Int) -> Void)?
    var showCallback: ((_ id: Int) -> Void)?

    
    @IBAction func removeBtnTap(_ sender: Any) {
        delegate?.removeItem(id)
        removeCallback?(id)
    }
    @IBAction func editBtnTap(_ sender: Any) {
        delegate?.showEdit(task!)
        editCallback?(task!)
    
    }
    @IBAction func taskTitleTap(_ sender: Any) {
        delegate?.showTask(id)
        showCallback?(id)
    }
    
}
