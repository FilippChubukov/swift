import Cocoa

protocol Car: AnyObject {
    var name: String {get}
    var brand: String {get}

    var engine_on: Bool {get set}
    var windows_open: Bool {get set}
    
}

extension Car {
    func open_windows() {
        if windows_open {
            print("Windows already open.")
        } else {
            self.windows_open = true
        }
    }
    
    func close_windows() {
        if !windows_open {
            print("Windows already closed.")
        } else {
            self.windows_open = false
        }
    }
    
    func start_engine() {
        if engine_on {
            print("Engine already started.")
        } else {
            self.engine_on = true
        }
    }
    
    func stop_engine() {
        if !engine_on {
            print("Engine already stopped.")
        } else {
            self.engine_on = false
        }
    }
}

protocol sportCar_proto: Car {
    var fuel_rate: Double {get}
    var fuel_max: Double {get}
}

extension sportCar_proto {
    func calc_fuel(path : Double) {
        if fuel_max - (path / 100) * fuel_rate < 0 {
            print("Not enough fuel")
        } else {
            print("Remaining \(fuel_max - (path / 100) * fuel_rate)")
        }
    }
}

protocol trunkCar_proto: Car {
    var trunk_volume: Int { get }
    var trunk_freespace: Int { get }
    var trunk_occuppied_volume: Int { get set }
}

extension trunkCar_proto {
    func load(volume: Int) {
        if trunk_freespace < volume {
            print("Not enough freespace.")
        } else {
            self.trunk_occuppied_volume += volume
        }
    }
}

class sportCar: sportCar_proto {
    var name: String
    var brand: String
    var windows_open: Bool
    var engine_on: Bool
    
    var fuel_rate: Double
    var fuel_max: Double
    
    init(name: String, brand: String, fuel_rate: Double, fuel_max: Double) {
        self.name = name
        self.brand = brand
        self.engine_on = false
        self.windows_open = false
        self.fuel_rate = fuel_rate
        self.fuel_max = fuel_max
    }
}

class trunkCar: trunkCar_proto {
    var name: String
    var brand: String
    var windows_open: Bool
    var engine_on: Bool
    
    var trunk_volume: Int
    var trunk_occuppied_volume: Int
    
    var trunk_freespace: Int {
        return trunk_volume - trunk_occuppied_volume
    }
    
    init(name: String, brand: String, trunk_volume: Int) {
        self.name = name
        self.brand = brand
        self.engine_on = false
        self.windows_open = false
        self.trunk_volume = trunk_volume
        self.trunk_occuppied_volume = 0
    }
    
}

extension sportCar: CustomStringConvertible {
    var description: String {
        return "\(name) \(brand) windows open: \(windows_open) engine started: \(engine_on) fuel_rate: \(fuel_rate) fuel_max: \(fuel_max)"
    }
}

extension trunkCar: CustomStringConvertible {
    var description: String {
        return "\(name) \(brand) windows open: \(windows_open) engine started: \(engine_on) trunk volume: \(trunk_volume) trunk occupied volume: \(trunk_occuppied_volume) trunk free space : \(trunk_freespace)"
    }
}


/* Init */
var sport_car_1 = sportCar(name: "WRX", brand: "Subaru", fuel_rate: 12, fuel_max: 60)

var sport_car_2 = sportCar(name: "Skyline", brand: "Nissan", fuel_rate: 11, fuel_max: 55)

var trunk_car_1 = trunkCar(name: "Largus", brand: "Lada", trunk_volume: 600)

var trunk_car_2 = trunkCar(name: "Outlander", brand: "Mitsibishi", trunk_volume: 500)

sport_car_1.start_engine()
sport_car_1.calc_fuel(path: 100)

sport_car_2.close_windows()
sport_car_2.calc_fuel(path: 1000)

trunk_car_1.stop_engine()
trunk_car_1.load(volume: 599)

trunk_car_2.open_windows()
trunk_car_2.load(volume: 1000)

print("\(sport_car_1.description)")
print("\(sport_car_2.description)")
print("\(trunk_car_1.description)")
    print("\(trunk_car_2.description)")
