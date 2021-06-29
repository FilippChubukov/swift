import Cocoa

enum car_action {
    case calc_tax
    case calc_range
    case load (volume: Int)
}

class Car {
    let name: String
    let brand: String
    let year: Int
    let horsepower: Int
    
    init (name: String, brand: String, year: Int, horsepower:Int) {
        self.name = name
        self.brand = brand
        self.year = year
        self.horsepower = horsepower
    }
    
    func do_action (action: car_action) {
    }
}

class sportCar: Car {
    var fuel_rate: Int
    var fuel_quantity: Int
    
    init (name: String, brand: String, year: Int, horsepower:Int, fuel_rate: Int, fuel_quantity: Int) {
        self.fuel_rate = fuel_rate
        self.fuel_quantity = fuel_quantity
        super.init(name: name, brand: brand, year: year, horsepower: horsepower)
    }
    
    override func do_action (action: car_action) {
        switch action {
        case .calc_tax:
            print("Tax is \(150 * self.horsepower)")
        case .calc_range:
            print("There are \(fuel_quantity / fuel_rate * 100) km left.")
        default:
            print("Not correct action for sport car.")
        }
        
    }
    
    func desc() {
        print("Sport car \(self.name) of the brand \(self.brand), released in \(self.year).")
        print("HP: \(self.horsepower). Fuel rate: \(self.fuel_rate). Fuel quantity: \(self.fuel_quantity)")
    }
    
}

class trunkCar: Car {
    let trunk_volume: Int
    var free_trunk_volume: Int
    init (name: String, brand: String, year: Int, horsepower:Int, trunk_volume: Int) {
        self.trunk_volume = trunk_volume
        self.free_trunk_volume = trunk_volume
        super.init(name: name, brand: brand, year: year, horsepower: horsepower)
    }
    
    override func do_action (action: car_action) {
        switch action {
        case .calc_tax:
            if self.horsepower < 100 {
                print("Tax is \(12 * self.horsepower)")
            } else if self.horsepower < 125 {
                print("Tax is \(25 * self.horsepower)")
            } else if self.horsepower < 150 {
                print("Tax is \(35 * self.horsepower)")
            } else if self.horsepower < 175 {
                print("Tax is \(45 * self.horsepower)")
            } else if self.horsepower < 200 {
                print("Tax is \(55 * self.horsepower)")
            } else if self.horsepower < 225 {
                print("Tax is \(65 * self.horsepower)")
            } else if self.horsepower < 250 {
                print("Tax is \(75 * self.horsepower)")
            } else {
                print("Tax is \(150 * self.horsepower)")
            }
        case .load(let volume):
            if self.free_trunk_volume < volume {
                print("Not enough free space.")
            } else {
                self.free_trunk_volume -= volume
                print("Load \(volume) and \(self.free_trunk_volume) left.")
            }
        default:
            print("Not correct action for trunk car.")
        }
    }
    
    func desc() {
        print("Trunk car \(self.name) of the brand \(self.brand), released in \(self.year).")
        print("HP: \(self.horsepower). Trunk volume: \(self.trunk_volume). Free trunk volume: \(self.free_trunk_volume)")
    }
}

/* Init */
var car_1 = sportCar(name: "WRX", brand: "Subaru", year: 2020, horsepower: 300, fuel_rate: 12, fuel_quantity: 60)

var car_2 = trunkCar(name: "Largus", brand: "Lada", year: 2020, horsepower: 97, trunk_volume: 500)

/* calc tax for car_1 */
car_1.do_action(action: .calc_tax)

/* calc tax for car_2 */
car_2.do_action(action: .calc_tax)

/* calc range for  car_1 */
car_1.do_action(action: .calc_range)

/* load to car_2 */
car_2.do_action(action: .load(volume: 499))

/* load to car_2 more then free space*/
car_2.do_action(action: .load(volume: 2))

/* print */
car_1.desc()
car_2.desc()
