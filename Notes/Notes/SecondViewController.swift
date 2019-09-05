//
//  SecondViewController.swift
//  Notes
//
//  Created by Ильдар Нигметзянов on 04/08/2019.
//  Copyright © 2019 Learning with Swift. All rights reserved.
//

import UIKit


class SecondViewController: UIViewController {

    var custom : customColor
    
    init(custom: customColor ) {
        self.custom = custom
        super.init(nibName: nil, bundle: nil)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }
    
    @IBOutlet weak var result: UIView!
    @IBOutlet weak var red: UISlider!
    @IBOutlet weak var green: UISlider!
    @IBOutlet weak var blue: UISlider!
    @IBOutlet weak var bright: UISlider!
    
    //var color : UIColor!
    
    func updateUI(){
        var r : CGFloat = 0
        var g : CGFloat = 0
        var b : CGFloat = 0
        var al : CGFloat = 0
        custom.custom = result.backgroundColor!
        
        custom.custom.getRed(&r,green: &g,blue: &b,alpha: &al)
        
        hex.text = "#" + String(format:"%02X",Int(r*255.0)) + String(format:"%02X",Int(g*255.0)) + String(format:"%02X",Int(b*255.0))
    }
   
    @IBAction func changeBright(_ sender: Any) {
     result.backgroundColor = UIColor(red: CGFloat( red!.value), green: CGFloat( green!.value), blue: CGFloat( blue!.value), alpha:CGFloat( bright!.value) )
        
        updateUI()
    }
    
    @IBAction func changeRed(_ sender: Any) {
        result.backgroundColor = UIColor(red: CGFloat( red!.value), green: CGFloat( green!.value), blue: CGFloat( blue!.value), alpha:CGFloat( bright!.value))
        updateUI()
    }
   
    @IBAction func changeGreen(_ sender: Any) {
        result.backgroundColor = UIColor(red: CGFloat( red!.value), green: CGFloat( green!.value), blue: CGFloat( blue!.value), alpha:CGFloat( bright!.value))
        updateUI()
    }
    
    @IBOutlet weak var hex: UILabel!
    
    
    @IBAction func changeBlue(_ sender: Any) {
         result.backgroundColor = UIColor(red: CGFloat( red!.value), green: CGFloat( green!.value), blue: CGFloat( blue!.value), alpha:CGFloat( bright!.value))
        updateUI()
    }
    
    @IBAction func test(_ sender: UIButton) {
         dismiss(animated:true,completion: nil)
    }
   

}
