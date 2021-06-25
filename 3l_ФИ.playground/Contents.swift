import Cocoa

struct SportCar {
    let name: String
    let brand: String
    let year: Int
    let trunk_volume: Int
    let body_volume: Int
    var engine_on: Bool
    var windows_open: Bool
    var trunk_filled_volume: Int
    var body_filled_volume: Int
    
    func desc() {
        print("Sport car \(name) of the brand \(brand), released in \(year). Trunk volume: \(trunk_volume). Body_volume: \(body_volume). Engine is On: \(engine_on). ")
        print("Windows are open: \(windows_open). Filled volume of trunk: \(trunk_filled_volume). Filled volume of body: \(body_filled_volume)")
    }
    
    mutating func do_action(action: car_action) {
        switch action {
            
        case .start_engine:
            if self.engine_on {
                print("Engine already started.")
            } else {
                self.engine_on = true
            }
            
        case .stop_engine:
            if !self.engine_on {
                print("Engine already stopped.")
            } else {
                self.engine_on = false
            }
                
        case .open_windows:
            if self.windows_open {
                print("Windows already opened.")
            } else {
                self.windows_open = true
            }
        
        case .close_windows:
            if !self.windows_open {
                print("Windows already closed.")
            } else {
                self.windows_open = false
            }
            
        case .load_trunk(let volume_in):
            if self.trunk_filled_volume + volume_in > self.trunk_volume {
                print("Not enough free space.")
            } else {
                self.trunk_filled_volume += volume_in
            }
            
        case .unload_trunk(let volume_out):
            if self.trunk_filled_volume < volume_out {
                self.trunk_filled_volume = 0
            } else {
                self.trunk_filled_volume -= volume_out
            }
            
        case .load_body(let volume_in):
            if self.body_filled_volume + volume_in > self.body_volume {
                print("Not enough free space.")
            } else {
                self.body_filled_volume += volume_in
            }
            
        case .unload_body(let volume_out):
            if self.body_filled_volume < volume_out {
                self.body_filled_volume = 0
            } else {
                self.body_filled_volume -= volume_out
            }
            
        }
    }
}

struct TrunkCar {
    let name: String
    let brand: String
    let year: Int
    let trunk_volume: Int
    let body_volume: Int
    var engine_on: Bool
    var windows_open: Bool
    var trunk_filled_volume: Int
    var body_filled_volume: Int
    
    func desc() {
        print("Trunk car \(name) of the brand \(brand), released in \(year). Trunk volume: \(trunk_volume). Body_volume: \(body_volume). Engine is On: \(engine_on). ")
        print("Windows are open: \(windows_open). Filled volume of trunk: \(trunk_filled_volume). Filled volume of body: \(body_filled_volume)")
    }
    
    mutating func do_action(action: car_action) {
        switch action {
            
        case .start_engine:
            if self.engine_on {
                print("Engine already started.")
            } else {
                self.engine_on = true
            }
            
        case .stop_engine:
            if !self.engine_on {
                print("Engine already stopped.")
            } else {
                self.engine_on = false
            }
                
        case .open_windows:
            if self.windows_open {
                print("Windows already opened.")
            } else {
                self.windows_open = true
            }
        
        case .close_windows:
            if !self.windows_open {
                print("Windows already opened.")
            } else {
                self.windows_open = false
            }
            
        case .load_trunk(let volume_in):
            if self.trunk_filled_volume + volume_in > self.trunk_volume {
                print("Not enough free space.")
            } else {
                self.trunk_filled_volume += volume_in
            }
            
        case .unload_trunk(let volume_out):
            if self.trunk_filled_volume < volume_out {
                self.trunk_filled_volume = 0
            } else {
                self.trunk_filled_volume -= volume_out
            }
            
        case .load_body(let volume_in):
            if self.body_filled_volume + volume_in > self.body_volume {
                print("Not enough free space.")
            } else {
                self.body_filled_volume += volume_in
            }
            
        case .unload_body(let volume_out):
            if self.body_filled_volume < volume_out {
                self.body_filled_volume = 0
            } else {
                self.body_filled_volume -= volume_out
            }
            
        }
    }
}

enum car_action {
    case start_engine
    case stop_engine
    case open_windows
    case close_windows
    case load_trunk(volume_in: Int)
    case unload_trunk(volume_out: Int)
    case load_body(volume_in: Int)
    case unload_body(volume_out: Int)
}

/* Init */
var sport_car = SportCar(name: "WRX", brand: "Subaru", year: 2020, trunk_volume: 368, body_volume: 300,
                         engine_on: false, windows_open: false, trunk_filled_volume: 0, body_filled_volume: 0)

var trunk_car = TrunkCar(name: "Largus", brand: "Lada", year: 2019, trunk_volume: 2500, body_volume: 350,
                         engine_on: false, windows_open: false, trunk_filled_volume: 0, body_filled_volume: 0)

/* Actions with structs */

/* Try start sport car engine */
var act = car_action.start_engine
sport_car.do_action(action: act)

/* Try stop trunk car's engine*/
act = .stop_engine
trunk_car.do_action(action: act)

/* Try open trunk car's windows */
act = .open_windows
trunk_car.do_action(action: act)

/* Try close sport car's windows */
act = .close_windows
sport_car.do_action(action: act)

/* Try load in sport car's trunk */
act = .load_trunk(volume_in: 150)
sport_car.do_action(action: act)

/* Try unload from sport car's trunk */
act = .unload_trunk(volume_out: 99)
sport_car.do_action(action: act)

/* try load in trunk car's trunk more then max volume */
act = .load_trunk(volume_in: 9999)
trunk_car.do_action(action: act)

/* Try unload from free trunk car's trunk */
act = .unload_trunk(volume_out: 100)
trunk_car.do_action(action: act)

/* Try load in trunk car's body */
act = .load_body(volume_in: 88)
trunk_car.do_action(action: act)

/* Try unload from trunk car's body*/
act = .unload_trunk(volume_out: 1)
trunk_car.do_action(action: act)

/* Try load in sport car's body more then max volume */
act = .load_body(volume_in: 9999)
sport_car.do_action(action: act)

/* Try unload from free sport car's body*/
act = .unload_body(volume_out: 100)
sport_car.do_action(action: act)

/* Print structs */
sport_car.desc()
trunk_car.desc()



