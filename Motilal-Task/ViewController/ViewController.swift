//
//  ViewController.swift
//  Motilal-Task
//
//  Created by Villian Raja on 18/09/21.
//

import UIKit
class ViewController: UIViewController {
    // MARK:- Outlet
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    @IBOutlet weak var tableView: UITableView!
    
    var viewModelTask = TaskViewModel()
    enum CellNames: String {
        case taskListTableViewCell = "TaskListTableViewCell"
    }
    let cellIdentifiers: [String] = [CellNames.taskListTableViewCell.rawValue]
    // MARK:- Overrides Method
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModelTask.getTaskData()
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Add", style: .plain, target: self, action: #selector(addTapped))
        setupTableView()
    }
    
    private func setupTableView() {
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.separatorStyle = .none
        self.tableView.rowHeight = UITableView.automaticDimension
        self.tableView.registerNibs(cellIdentifiers)
    }
    // MARK:- Action
    @IBAction func valuesChangedAction(_ sender: UISegmentedControl) {
        if segmentedControl.selectedSegmentIndex == 0 {
            print("First")
        } else if segmentedControl.selectedSegmentIndex == 1 {
            print("Second")
        } else if segmentedControl.selectedSegmentIndex == 2 {
            print("Third")
        }
    }
    
    @objc func addTapped() {
        let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "TodoTaskViewController") as? TodoTaskViewController
        vc?.taskDelegate = self   
        vc?.title = "Add Task"
        self.navigationController?.pushViewController(vc!, animated: true)
    }
}
// MARK:- Tableview DataSource
extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModelTask.taskList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CellNames.taskListTableViewCell.rawValue) as? TaskListTableViewCell else {
            return UITableViewCell()
        }
        cell.selectionStyle = .none
        cell.setupData(taskDetail: viewModelTask.taskList[indexPath.row])
        return cell
    }
}
// MARK:- Tableview Delegate
extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "TodoTaskViewController") as? TodoTaskViewController
        vc?.title = "Edit Task"
        vc?.taskDelegate = self
        vc?.userData = ["selectedTask": viewModelTask.taskList[indexPath.row], "isEdit": true,"indexValues":indexPath.row]
        self.navigationController?.pushViewController(vc!, animated: true)
    }
}
// MARK:- Delegate Method
extension ViewController: TodoTaskActionDelegate {
    func addEditTask() {
        viewModelTask.getTaskData()
        self.tableView.reloadData()
    }
}





