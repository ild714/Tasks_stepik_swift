//
//  Note.swift
//
//
//  Created by Ильдар Нигметзянов on 21/06/2019.
//

import Foundation
import UIKit

enum  importance : String {
    case  serious
    case  general
    case  so_so
}

struct Note {
    let uid: String
    let title: String
    let content: String
    let color: UIColor
    let important: importance
    let date_destruction : Date? //объявляем var для необязательного ввода Date
    
    init (uid:String = UUID().uuidString, title: String, content : String , color : UIColor = UIColor.white,important:importance,date_destruction: Date?  ){
        self.uid = uid
        self.title = title
        self.content = content
        self.color = color
        self.important=important
        self.date_destruction = date_destruction
        
    }
}

