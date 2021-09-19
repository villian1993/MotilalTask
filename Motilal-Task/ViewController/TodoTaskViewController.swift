//
//  TodoTaskViewController.swift
//  Motilal-Task
//
//  Created by Villian Raja on 18/09/21.
//

import UIKit
import CoreData
// MARK:- Protocol Method
protocol TodoTaskActionDelegate: class {
    func addEditTask()
}
class TodoTaskViewController: UIViewController {
    // MARK:- Outlet
    @IBOutlet weak var addTaskButton: UIButton!
    @IBOutlet weak var deleteButton: UIButton!
    @IBOutlet weak var tittleTextField: UITextField!
    @IBOutlet weak var descriptionTextField: UITextField!
    // MARK:- Variable Declaration
    var isEditable: Bool = false
    var userData: [String: Any]?
    var selectedTask: TodoTaskModel?
    var taskId: Int = 0
    weak var taskDelegate: TodoTaskActionDelegate?
    // MARK:- Overrides Method
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    func setupView() {
        isEditable = ((userData?["isEdit"]) != nil)
        selectedTask = userData?["selectedTask"] as? TodoTaskModel
        taskId = userData?["indexValues"] as? Int ?? 0
        setupButtonView()
        setupData()
    }
    
    func setupData() {
        tittleTextField.text = selectedTask?.tittle
        descriptionTextField.text = selectedTask?.description
    }
    
    func setupButtonView() {
        addTaskButton.setCornerStyle()
        deleteButton.setCornerStyle()
        self.addTaskButton.setTitle(isEditable ? "Edit Task" : "Add Task", for: .normal)
        self.deleteButton.isHidden = isEditable ? false : true
    }
    
    // MARK:- Action
   @IBAction func addTaskButtonClicked(_ sender: UIButton) {
        if validationCheck() {
            let dictionaryValues = ["tittle":tittleTextField.text,"tittleDescription":descriptionTextField.text]
            if isEditable {
                DatabaseHelper.shareInstance.edittoDoTaskData(object: dictionaryValues as! [String : String], i: taskId)
            } else {
                DatabaseHelper.shareInstance.saveToDoTask(object: dictionaryValues as! [String : String])
            }
            self.taskDelegate?.addEditTask()
            self.navigationController?.popViewController(animated: true)
        } else {
            let alert = UIAlertController(title: "Error!", message: "Task Title and Description can't be empty.", preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    @IBAction func deleteButtonClicked(_ sender: UIButton) {
        DatabaseHelper.shareInstance.deleteTask(index: taskId)
        self.taskDelegate?.addEditTask()
        self.navigationController?.popViewController(animated: true)
    }
    // MARK:- Validation Method
    func validationCheck() -> Bool {
        if let title = tittleTextField.text, !title.isEmpty {
            return true
        }
        return false
    }
}
