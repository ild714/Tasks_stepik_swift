//
//  FileNotebook.swift
//
//
//  Created by Ильдар Нигметзянов on 21/06/2019.
//

import UIKit


class FileNoteBook {
    init () {
        self.collection = [Note]()
    }
    public var collection : [Note]?
    public func add(_ note : Note) {
        collection?.append(note)
    }
    public func remove(with uid : String) {
        var ell : Int = 0
        if var collection = collection{
            for i in collection {
                ell+=1
                if uid == i.uid {
                    collection.remove(at: ell)
                }
            }
        }
    }
    
    func saveToFile() {
        //Get the url of .json in document directory
        var num = 0
        if let collection = collection {
            guard let documentDirectoryUrl = FileManager.default.urls(for:.cachesDirectory,in:.userDomainMask).first else {return}
            let fileUrl = documentDirectoryUrl.appendingPathComponent("data2.json")
            var dict : [String:[String:Any]] = [String:[String:Any]]()
            for i in collection {
                
                dict[String(num)] = i.json
                // Write Data
                do {
                    let dataJson = try! JSONSerialization.data(withJSONObject: dict, options: [])
                    try dataJson.write(to: fileUrl,options: [])
                    print("The file have been safetied sucessfully")
                } catch {
                    print (error)
                }
                num+=1
            }
        }
    }
    
    func loadFromFile() {
        
        // Get the url of .json in document directory
        guard let documentsDirectoryUrl = FileManager.default.urls(for:.cachesDirectory,in :.userDomainMask).first else {return}
        let fileUrl = documentsDirectoryUrl.appendingPathComponent("data2.json")
        //Read Data and transform to dictionary
        do {
            
            let dataJson = try Data(contentsOf:fileUrl,options: [])
            if dataJson.isEmpty == true {} else {
            guard let dict = try JSONSerialization.jsonObject(with: dataJson, options: []) as? [String:[String:Any]] else {return}
            for (_,j) in dict {
                print (j)
                collection?.append(Note.parse(json: j)!)
                print(dict)
            }
            }
        } catch {
            print (error)
        }
    }
}
