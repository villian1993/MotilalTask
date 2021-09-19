//
//  ToDoTask+CoreDataProperties.swift
//  Motilal-Task
//
//  Created by Villian Raja on 18/09/21.
//
//

import Foundation
import CoreData


extension ToDoTask {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<ToDoTask> {
        return NSFetchRequest<ToDoTask>(entityName: "ToDoTask")
    }

    @NSManaged public var tittle: String?
    @NSManaged public var tittleDescription: String?
    
    func getTodoTaskModel() -> TodoTaskModel {
        var model = TodoTaskModel()
        model.tittle = tittle
        model.description = tittleDescription
        return model
    }

}

extension ToDoTask : Identifiable {

}
