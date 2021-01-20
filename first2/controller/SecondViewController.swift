import UIKit

class SecondViewController: UIViewController{
    
    @IBOutlet weak var tableView: UITableView!
    var tasks = [ToDoItem]()
    let cellId="cell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        appendArrAtStart()
        
        tableView.delegate=self
        tableView.dataSource = self
        
        tableView.register(UINib(nibName: "TableViewCell", bundle: nil), forCellReuseIdentifier: cellId)
    }
    
    func appendArrAtStart(){
        tasks.append(ToDoItem(id: 0, title: "uno", desc:"aha",dedline: "05.07.2021"))
        tasks.append(ToDoItem(id: 1, title: "dos", desc:"aha",dedline: "29.12.2021"))
    }
    
    @IBAction func add(_ sender: UIBarButtonItem) {
        let vc=storyboard?.instantiateViewController(identifier: "addNewTask") as! AddViewController //vc became storyboard[add Task page)]
        
        vc.title="New Task"
        vc.id=tasks.count
        vc.delegate=self
        
        navigationController?.pushViewController(vc, animated: true) //go to (rediredt to) AddTaskPage
    }
    
    func goToTaskPage(_ id:Int) {
         let vcTask=storyboard?.instantiateViewController(identifier: "taskId") as! TaskViewController
       
        vcTask.title="Task Page"
        vcTask.task = tasks[id]
        vcTask.delegate=self
        
        navigationController?.pushViewController(vcTask, animated: true) //go to (rediredt to) EditTaskPage
    }
}
protocol SecondViewControllerDelegate {
    func removeItem(_ id: Int)
    func editItem(_ item:ToDoItem)
    func showTask(_ id:Int)
    func showEdit(_ item:ToDoItem)
    func addTask(_ item:ToDoItem)
}

extension SecondViewController: SecondViewControllerDelegate{
    func addTask(_ item:ToDoItem){
        tasks.append(item)
        tableView.reloadData()
    }
    func removeItem(_ id: Int) {
        tasks.remove(at: id)
        tableView.reloadData()
    }
    
    func editItem(_ item:ToDoItem) {
        tasks[item.id ?? 0]=item
        tableView.reloadData()
    }
    
    func showTask(_ id:Int) {
        goToTaskPage(id)
    }
    func showEdit(_ item:ToDoItem){
        let vcEdit=storyboard?.instantiateViewController(identifier: "editVC") as! EditViewController
        
        vcEdit.title="Edit Task"
        vcEdit.task=item
        vcEdit.delegate=self
        
        navigationController?.pushViewController(vcEdit, animated: true)
    }
    
}
extension SecondViewController: UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId,for: indexPath) as! TableViewCell
        
        let item = tasks[indexPath.row]
        
        cell.delegate=self
        cell.titleBtn.setTitle(item.title, for: .normal)
        cell.id=indexPath.row
        cell.task=item
     
        return cell
    }
}
