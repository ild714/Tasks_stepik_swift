//
//  NoteExtension.swift
//
//
//  Created by Ильдар Нигметзянов on 06/07/2019.
//

import UIKit


extension Note {
    static func parse(json : [String:Any]) -> Note? {
        guard let uid = json["uid"] as? String else {return nil}
        guard let title = json["title"] as? String else {return nil}
        guard let content = json["content"] as? String else {return nil}
        var color = UIColor.white
        if json["color"] != nil{
            guard let colorMap = json["color"] as? [String:Double] else {return nil}
            if let red = colorMap["red"] , let green = colorMap["green"], let blue = colorMap["blue"], let alpha = colorMap["alpha"] {
                color = UIColor(red: CGFloat(red/255.0), green: CGFloat(green/255.0), blue: CGFloat(blue/255.0), alpha: CGFloat(alpha/1.0))
            }
        }
        var importance0 = Importance.general
        if json["importance"] != nil {
            guard let importance1 = json["importance"] as? String else {
                return nil
            }
            if let im =  Importance(rawValue: importance1) {
                importance0 = im }
        }
        
        
       
        var destractionDate : Date? = nil
        if let dateDestraction = json["dateDestraction"] as? Double {
        destractionDate = Date(timeIntervalSince1970: dateDestraction)
        }
        return Note(uid: uid , title: title , content: content , color: color, importance: importance0 , dateDestraction: destractionDate )
    }
    
    var json : [String:Any] {
        
        var dict = [String:Any]()
        
        dict["uid"] = self.uid
        dict["title"] = self.title
        dict["content"] = self.content
        if self.color != UIColor.white {
            var r : CGFloat = 0
            var g : CGFloat = 0
            var b : CGFloat = 0
            var al : CGFloat = 0
            
            self.color.getRed(&r,green: &g,blue: &b,alpha: &al)
            dict["color"] = ["red":Double(r*255.0),"green":Double(g*255.0),"blue":Double(b*255.0),"alpha":Double(al)]
                //String(format:"%02X",Int(r*255.0)) + String(format:"%02X",Int(g*255.0)) + String(format:"%02X",Int(b*255.0))
        }
        if self.importance != .general {
            dict["importance"] = self.importance.rawValue
        }
        //let fmt = DateFormatter()
        //fmt.dateFormat = "yyyy-MM-dd HH:mm:ss"
        //if let time = self.dateDestraction {
            //let dateClear = fmt.string(from:time)
        if let dateDestruction = self.dateDestraction {
            dict["dateDestraction"] = dateDestruction.timeIntervalSince1970
        }
        return dict
        
    }
}
        
