//
//  ViewController.swift
//  Notes
//
<<<<<<< HEAD
//  Created by Ильдар Нигметзянов on 03/08/2019.
//  Copyright © 2019 Learning with Swift. All rights reserved.
=======
//  Created by Ильдар Нигметзянов on 06/07/2019.
//  Copyright © 2019 Ильдар Нигметзянов. All rights reserved.
>>>>>>> 69fd8ccec4e1c781d6e1ca7922d84ac63d6da004
//

import UIKit

<<<<<<< HEAD
class customColor {
    var custom : UIColor = UIColor.white
}

class ViewController: UIViewController {
    
    var detail : Note?
    
    init(notes : FileNoteBook,detail : Note?) {
        super.init(nibName: nil, bundle: nil)
        self.notes = notes
        self.detail = detail
    }

    
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    @IBOutlet var view44: UIView!
    @IBOutlet weak var text: UITextView!
    @IBOutlet var titleUp: UITextField!
    
    var custom = customColor()
    var textTitle : String?
    var textMain: String?
    //var colorMain: String?
    
    
    var notes = FileNoteBook()
    
    @IBOutlet weak var viewWhite: UIView!
    @IBOutlet weak var save: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
       
        tick1.isHidden = true
        tick2.isHidden = true
        tick3.isHidden = true
        tick4.isHidden = true

        time.isHidden = true
        viewWhite.layer.borderWidth = 0.5
        titleUp.text = textTitle
        text.text = textMain
        //save.layer.borderWidth = 0.5
    }
    
    
    @IBOutlet var tick1: DrawView!
    var bool1 = true
    var bool2 = true
    var bool3 = true
    var bool4 = true
    
    @IBOutlet var tick2: DrawView!
    @IBOutlet var tick3: DrawView!
    @IBOutlet weak var tick4: DrawView!
    
   
    
    @IBOutlet weak var time: UIDatePicker!
    var timeShow : Bool = false
    
    @IBAction func showTime(_ sender: Any) {
        time.isHidden = timeShow ? true : false
        timeShow = !time.isHidden
    }
    
    @IBAction func tapped1(_ sender: Any) {
        tick1.isHidden = bool1 ? false : true
        bool1 = tick1.isHidden
        tick2.isHidden = true
        bool2 = tick2.isHidden
        tick3.isHidden = true
        bool3 = tick3.isHidden
        tick4.isHidden = true
        bool4 = tick4.isHidden
        //notes.add(Note(title: titleUp.text!, content: text.text, color: UIColor.white, importance: Importance.general, dateDestraction: nil))
        
    }
    @IBAction func tapped2(_ sender: Any) {
        tick2.isHidden = bool2 ? false : true
        bool2 = tick2.isHidden
        tick1.isHidden = true
        bool1 = tick1.isHidden
        tick3.isHidden = true
        bool3 = tick3.isHidden
        tick4.isHidden = true
        bool4 = tick4.isHidden
        //notes.add(Note(title: titleUp.text!, content: text.text, color: UIColor.red, importance: Importance.unimportant, dateDestraction: nil))
    }
    @IBAction func tapped3(_ sender: Any) {
        tick3.isHidden = bool3 ? false : true
        bool3 = tick3.isHidden
        tick2.isHidden = true
        bool2 = tick2.isHidden
        tick1.isHidden = true
        bool1 = tick1.isHidden
        tick4.isHidden = true
        bool4 = tick4.isHidden
         //notes.add(Note(title: titleUp.text!, content: text.text, color: UIColor.green, importance: Importance.general, dateDestraction: nil))
    }
    
    @IBOutlet weak var image: UIImageView!
    
    func afterSecondView() {
        //let secondViewController = SecondViewController()
        //view4.backgroundColor = secondViewController.color
        tick4.isHidden = false
        tick1.isHidden = true
        tick2.isHidden = true
        tick3.isHidden = true
        bool1 = true
        bool2 = true
        bool3 = true
        bool4 = false
        view44.backgroundColor = custom.custom
        tick4.backgroundColor = custom.custom
        image.isHidden = true
         //notes.add(Note(title: titleUp.text!, content: text.text, color: custom.custom, importance: Importance.general, dateDestraction: nil))
    }
   
    @IBAction func secondViewController(_ sender: Any) {
        let secondViewController = SecondViewController(custom: custom)
        present(secondViewController,animated: true,completion: nil)
    }
    
    var boolForTick = false
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        //viewDidLoad()
        if custom.custom != UIColor.white {
            afterSecondView()
        }
    }
    
    
    @IBAction func changeTitle(_ sender: Any) {
        detail?.title = titleUp.text!
    }
    
    
    @IBAction func update(_ sender: Any) {
        let b : Bool = false
        switch b {
        case tick1.isHidden  :
        if let index = notes.collection?.firstIndex(where:{$0.uid == detail?.uid}){
            notes.collection?[index] = Note(title: titleUp.text!, content: text.text, color: UIColor.white, importance: Importance.general, dateDestraction: nil)
        } else {
            notes.add(Note(title: titleUp.text!, content: text.text, color: UIColor.white, importance: Importance.general, dateDestraction: nil))
        }
        case tick2.isHidden  :
            if let index = notes.collection?.firstIndex(where:{$0.uid == detail?.uid}){
                notes.collection?[index] = Note(title: titleUp.text!, content: text.text, color: UIColor.red, importance: Importance.general, dateDestraction: nil)
            } else {
                notes.add(Note(title: titleUp.text!, content: text.text, color: UIColor.red, importance: Importance.general, dateDestraction: nil))
            }
            
        case tick3.isHidden :
            if let index = notes.collection?.firstIndex(where:{$0.uid == detail?.uid}){
                notes.collection?[index] = Note(title: titleUp.text!, content: text.text, color: UIColor.green, importance: Importance.general, dateDestraction: nil)
            } else {
                notes.add(Note(title: titleUp.text!, content: text.text, color: UIColor.green, importance: Importance.general, dateDestraction: nil))
            }
        default :
            if let index = notes.collection?.firstIndex(where:{$0.uid == detail?.uid}){
            notes.collection?[index] = Note(title: titleUp.text!, content: text.text, color: UIColor.white, importance: Importance.general, dateDestraction: nil)
        } else {
            notes.add(Note(title: titleUp.text!, content: text.text, color: custom.custom, importance: Importance.general, dateDestraction: nil))
            }
        }
        notes.saveToFile()
  
//        let next = storyboard?.instantiateViewController(withIdentifier: "a") as! TableViewController
//        next.tableView.reloadData()
        navigationController?.popToRootViewController(animated: true)
        
       
 
    }
    
=======
class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


>>>>>>> 69fd8ccec4e1c781d6e1ca7922d84ac63d6da004
}

