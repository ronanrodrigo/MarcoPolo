//
//  PunchGatewayFake.swift
//  MarcoPonto
//
//  Created by Ronan Rodrigo Nunes on 20/04/16.
//  Copyright © 2016 Ronan Rodrigo Nunes. All rights reserved.
//

import Foundation
import SwiftDate

class PunchGatewayFake: PunchGateway {
    var punchs: [Punch] = []
    
    func create(punch: Punch) {
        punchs.append(punch)
    }
    
    func update(punch: Punch) { }
    
    func delete(punch: Punch) { }
    
    func list() -> [Punch] {
        return punchs
    }
    
    func list(by type: PunchType, between firstDate: NSDate, and lastDate: NSDate) -> [Punch] {
        return punchs.filter { (punch) -> Bool in
            punch.type == type && punch.moment >= firstDate && punch.moment <= lastDate
        }
    }
}