import UIKit

enum GoError : Error {
    case changeDistance
}

struct Go {
    enum Direction {
        case right
        case left
        case down
        case up
    }
    
    let whereGo : Direction
    let howLong : Double
    
    init(whereGo : Direction , howLong : Double) throws {
        guard howLong > 0 else {
            throw GoError.changeDistance
        }
        self.whereGo = whereGo
        self.howLong = howLong
    }
}

class Car {
    
    static let wheelAmount = 4
    class var sellAmount : Int {
        return 5
    }
    
    let model : String
    let color : UIColor
    var recordSpeed : Int?
    
    init(model: String,color: UIColor, recordSpeed : Int?){
        self.model = model
        self.color = color
        self.recordSpeed = recordSpeed
    }
    
    func right (dist : Double) {
        print (dist)
    }
    
    func left (dist : Double) {
        print (dist)
    }
    
    func down (dist : Double) {
        print (dist)
    }
    
    func up (dist : Double) {
        print (dist)
    }
    
    
    func execute (_ strc : Go) {
        switch strc.whereGo
        {
        case .right :
            right(dist : strc.howLong)
        case .left :
             left(dist : strc.howLong)
        case .down :
             up(dist : strc.howLong)
        default :
             down(dist : strc.howLong)
    }
}

}

let wh = try Go(whereGo: .right, howLong: 50)

let car1 = Car(model: "tt", color: UIColor.black, recordSpeed: 300)

car1.execute(wh)
