//
//  EntryTipe.swift
//  MarcoPonto
//
//  Created by Ronan Rodrigo Nunes on 16/04/16.
//  Copyright © 2016 Ronan Rodrigo Nunes. All rights reserved.
//

import Foundation

enum EntryType: NSNumber {
    case Input = 1, Output = 2
    
    func description() -> String {
        switch self {
        case .Input:
            return "Saída"
        default:
            return "Entrada"
        }
    }
}
