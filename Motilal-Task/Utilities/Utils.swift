//
//  Utils.swift
//  Motilal-Task
//
//  Created by Villian Raja on 18/09/21.
//

import Foundation
import UIKit
class Utils {
    
}
// MARK:- Round Corner UiView Method
extension UIView {
    
    func setAsRounded(cornerRadius: CGFloat = 5.0) {
        self.layoutIfNeeded()
        self.layer.cornerRadius = cornerRadius
        self.clipsToBounds = true
    }
}
// MARK:- Button Corner Method
extension UIButton {
    func setCornerStyle() {
        self.layer.cornerRadius = 15.0
    }
}
// MARK:- tableView Cell Details
extension UITableView {
    
    func registerNibs(_ cellIdentifiers: [String]) {
        
        for identifier in cellIdentifiers {
            self.register(UINib(nibName: identifier, bundle: nil), forCellReuseIdentifier: identifier)
        }
    }
}



