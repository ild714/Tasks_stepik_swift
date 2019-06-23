//
//  Task5.swift
//  
//
//  Created by Ильдар Нигметзянов on 23/06/2019.
//

import Foundation


extension Note {
    static func parse(json:[String:Any])->Note?{
        do {
            let jsdata = try JSONSerialization.data(withJSONObject:json,options:[])
            print (jsdata)
            let jsdict = try JSONSerialization.jsonObject(with: jsdata,options: []) as? [String: Any]
            
            
            
            var mas1 :[String] = []
            //var mas2 :[Any] = []
            var mas3 :[Any] = []
            
            var json : [String:Any] {
                get
                { return json}
            }
            
            
            for (i,j) in jsdict!  {
                mas1.append(i)
                //mas2.append(j)
                if mas1 == ["uid"] {
                    mas3.append(j)
                }
                else if mas1 == ["title"] {
                    mas3.append(j)
                } else if mas1 == ["content"] {
                    mas3.append(j)
                } else if mas1 == ["color"] {
                    mas3.append(j)
                } else if mas1 == ["important"] {
                    mas3.append(j)
                } else if mas1 == ["date_destruction"] {
                    mas3.append(j)
                    
                }
            }
            
            let fmt = DateFormatter()
            fmt.dateFormat = "yyyy-MM-dd"
            //let str = fmt.string(from: now1)
            
            let now3 = fmt.date(from: mas3[5] as! String)
            
            self.init(uid: mas3[0] as! String, title: mas3[1] as! String, content: mas3[2] as! String, color: mas3[3] as! UIColor, important: mas3[4] as! importance , date_destruction: now3)
            
        } catch{
            print("error")
        }
        
    }
}


extension Note {
    
    
    var json : [String:Any] {
        get
        { let guard self.color==UIColor.white else {
            // сохранение в json . Не совсем понял как реализоовать
            }
            let guard self.important==importance(rawValue: "so_so") as! importance else {
                // сохранение в json . Не совсем понял как реализоовать
            }
            return json}
    }
    
    
}

