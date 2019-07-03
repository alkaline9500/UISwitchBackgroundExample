//
//  SwitchCell.swift
//  UISwitchBackgroundExample
//
//  Created by Nicolas Manoogian on 7/3/19.
//  Copyright © 2019 Nic Manoogian. All rights reserved.
//

import UIKit

class SwitchCell: UITableViewCell {
    
    let cellSwitch: UISwitch = {
        let cellSwitch = UISwitch()
        cellSwitch.onTintColor = UIColor.red
        return cellSwitch
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(cellSwitch)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        print("prepareForReuse: \(self)")
        // DEBUG: Removing this `setOn` makes the problem unreproducible
        self.cellSwitch.setOn(false, animated: false)
    }
}
