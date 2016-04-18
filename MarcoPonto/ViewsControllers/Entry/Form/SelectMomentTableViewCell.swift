//
//  SelectMomentTableViewCell.swift
//  MarcoPonto
//
//  Created by Ronan Rodrigo Nunes on 16/04/16.
//  Copyright © 2016 Ronan Rodrigo Nunes. All rights reserved.
//

import UIKit

class SelectMomentTableViewCell: UITableViewCell {

    @IBOutlet weak var momentSelector: UIDatePicker!
    
    override func awakeFromNib() {
        separatorInset = UIEdgeInsetsZero
        preservesSuperviewLayoutMargins = false
        layoutMargins = UIEdgeInsetsZero
    }

    func fillData(moment: NSDate?) {
        if let _moment = moment {
            momentSelector.date = _moment
        }
    }
}
