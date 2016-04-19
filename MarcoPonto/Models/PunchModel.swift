//
//  PunchModel.swift
//  MarcoPonto
//
//  Created by Ronan Rodrigo Nunes on 19/04/16.
//  Copyright © 2016 Ronan Rodrigo Nunes. All rights reserved.
//

import Foundation
import CoreData


class PunchModel: NSManagedObject, Punch {

    var moment: NSDate {
        get {
            return punchMoment ?? NSDate()
        } set {
            punchMoment = newValue
        }
    }
    
    var type: PunchType {
        get {
            return PunchType(rawValue: punchType ?? 1)!
        } set {
            punchType = newValue.rawValue
        }
    }
    
    var id: Int? {
        get {
            return punchId as Int?
        } set {
            punchId = newValue
        }
    }
    
    func isNewPunch() -> Bool {
        return id == nil
    }

}
