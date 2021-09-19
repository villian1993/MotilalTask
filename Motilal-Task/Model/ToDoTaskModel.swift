//
//  ToDoTaskModel.swift
//  Motilal-Task
//
//  Created by Villian Raja on 18/09/21.
//

import Foundation
import Foundation

struct TodoTaskModel: Codable {
    
    var tittle: String?
    var description : String?
    
    init(){
        
    }
    
    enum CodingKeys: String, CodingKey {
        case tittle = "title"
        case description = "todoDescription"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
       tittle = try values.decodeIfPresent(String.self, forKey: .tittle)
        description = try values.decodeIfPresent(String.self, forKey: .description)
    }
}
