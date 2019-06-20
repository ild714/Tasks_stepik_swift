import UIKit

enum GoError: Error {
    case changeDistance
}

struct Go {
    enum Direction{
        case forward
        case back
        case left
        case right
    }
    let direction: Direction
    let distance: Double
    
    init(direction:Direction,distance:Double) throws {
        guard distance > 0 else {
            throw GoError.changeDistance
        }
        self.direction=direction
        self.distance=distance
    }
}

class Car {
    private let mark: String
    private let type: String
    
    init(mark:String, type: String ){
        self.mark = mark
        self.type = type
    }
    
    // forward
    func forward(distance: Double){
        print ("Duration forward = \(distance)")
    }
    
    // back
    func back(distance: Double){
        print ("Duration back = \(distance)")
    }
    
    // left
    func left(distance: Double){
        print ("Duration left = \(distance)")
    }
    
    // right
    func right(distance: Double){
        print ("Duration right = \(distance)")
    }
    
    
    func execute(go:Go){
        switch go.direction{
        case .forward:
            forward(distance: go.distance)
        case .back:
            back(distance: go.distance)
        case .left:
            left(distance : go.distance)
        case .right:
            right(distance: go.distance)
        }
    }
    
}

let car1: Car = Car(mark: "bmv", type: "1")
let go: Go = try Go(direction: .left, distance: 100)

car1.execute(go:go)
