//
//  FileNotebook.swift


import UIKit

class FileNotebook {
    
    private(set) var notes: [Note] = []
    
    public func add(_ note: Note) {
        var isChecked = false //Флажок для проверки существования заметки с такой же uid
        //Если массив пустой, то добавляем элемент без проверки
        if notes.count == 0 {
            notes.append(note)
            isChecked = true
        }
        else {
            // Если массив не пустой, то перебираем все эдементы массива и если находим элемент с таким же uid, то заменяем его на тот, который передали при вызове функции add()
            for  i in 0...notes.count-1 {
                if notes[i].uid == note.uid {
                    notes.remove(at: i)
                    notes.insert(note, at: i)
                    isChecked = true
                    break
                }
            }
        }
        // Если не нашли элемент с повторяющимся uid, то добавляем элемент в конец массива
        if !isChecked {
            notes.append(note)
        }
    }
    
    public func remove(with uid: String) {
        for  i in 0...notes.count-1 {
            if notes[i].uid == uid {
                notes.remove(at: i)
                break
            }
        }
    }
    
    public func saveToFile() {
        guard let path =
            FileManager.default.urls(for: .cachesDirectory, in: .userDomainMask).first else {return}
        
        let json = notes.map {$0.jsonMap}
        
        do {
            let data = try JSONSerialization.data(withJSONObject: json, options: [])
            try data.write(to: path.appendingPathComponent("FileNotebook"))
        }
        catch {
            print("Error With Saving File")
        }
    }
    
    public func restoreFromFile()  {
        guard let cashesUrl =
            FileManager.default.urls(for: .cachesDirectory, in: .userDomainMask).first else {return}
        
        do {
            let data = try Data(contentsOf: cashesUrl.appendingPathComponent("FileNotebook"))
            let json = try JSONSerialization.jsonObject(with: data, options: []) as! [[String: Any]]
            notes = json.map {Note.parse(json: $0)}.compactMap{$0}
            
        } catch {
            print("Error With Loading FIle")
        }
    }
    
}

