//
//  Note.swift
//
//
//  Created by Ильдар Нигметзянов on 21/06/2019.
//

import Foundation
import UIKit
enum Importance : String {
    case important = "important"
    case general = "general"
    case unimportant = "unimportant"
}

struct Note {
    
    let uid : String
    var title : String
    var content : String
    var color : UIColor
    var importance : Importance
    var dateDestraction : Date?
    
    init(uid : String = UUID().uuidString, title : String  , content : String, color : UIColor , importance : Importance,dateDestraction: Date? ){
        self.uid = uid
        self.title = title
        self.content = content
        self.color = color
        self.importance = importance
        self.dateDestraction = dateDestraction
    }
}
