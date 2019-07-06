//
//  NoteExtension.swift
//  
//
//  Created by Ильдар Нигметзянов on 06/07/2019.
//

import UIKit

enum  importance : String {
    case  serious = "serious"
    case  general = "general"
    case  so_so = "so-so"
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


extension Note {
    var json : [String:Any]{
        get {
            var jsonMap = [String:Any]()
            jsonMap["uid"] = self.uid
            jsonMap["title"] = self.title
            jsonMap["content"] = self.content
            // если цвет не белый сохраняем его в json
            if self.color != UIColor.white {
                var red : CGFloat = 0
                var green : CGFloat = 0
                var blue : CGFloat = 0
                var alpha : CGFloat = 0
                if self.color.getRed(&red,green: &green, blue: &blue,alpha: &alpha) {
                    jsonMap["color"] = ["red":Int(red),"green":Int(green),"blue":Int(blue),"alpha":Int(alpha)]
                }
            }
            if self.important != .general {
                jsonMap["importance"] = self.important.rawValue
            }
            if let date_destruction = self.date_destruction{
                jsonMap["date"]=date_destruction.timeIntervalSince1970
            }
            return jsonMap
        }
        
    }
    
    static func parse(json : [String : Any] ) -> Note?{
        guard let uid = json["uid"] as? String else {
            return nil
        }
        guard let title = json["title"] as? String else {
            return nil
        }
        guard let content = json["content"] as? String else {
            return nil
        }
        
        var color :UIColor = .white
        if json["color"] != nil {
            guard let ColorMap = json["color"] as? [String:Int] else {return nil
            }
            if let red = ColorMap ["red"] , let green = ColorMap["green"], let blue = ColorMap["blue"], let alpha = ColorMap["alpha"] {
                color = UIColor (red : CGFloat(red),green: CGFloat(green),blue:CGFloat(blue),alpha: CGFloat(alpha))
            }
            
        }
        var importance0 : importance = .general
        if json["importance"] != nil {
            guard let importanse1 = importance0 as? String else {
                return nil
            }
            if let im = importance(rawValue: importanse1){
                importance0 = im
            } else {
                return nil
            }
        }
        
        var destructiondate : Date? = nil
        if let destX = json["selfDestDate"] as? Double{
            destructiondate = Date(timeIntervalSince1970: destX)
        }
        return Note(uid: uid, title: title, content: content, color: color, important: importance0, date_destruction: destructiondate)
    }
}

