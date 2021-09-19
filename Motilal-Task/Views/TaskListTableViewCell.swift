//
//  TableViewCell.swift
//  Motilal-Task
//
//  Created by Villian Raja on 18/09/21.
//

import UIKit

class TaskListTableViewCell: UITableViewCell {
    
    // MARK:- Outlet
    @IBOutlet weak var taskView: UIView!
    @IBOutlet weak var tittleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    // MARK:- Overrides Method
    override func awakeFromNib() {
        super.awakeFromNib()
       setupView()
    }
    
    func setupView() {
        taskView.setAsRounded(cornerRadius: 10.0)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    // set tittle and description  in tableView Cell
    func setupData(taskDetail: TodoTaskModel) {
        tittleLabel.text = taskDetail.tittle
        descriptionLabel.text = taskDetail.description
    }
    
}
