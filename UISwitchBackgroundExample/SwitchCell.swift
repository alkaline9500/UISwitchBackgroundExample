//
//  SwitchCell.swift
//  UISwitchBackgroundExample
//
//  Created by Nicolas Manoogian on 7/3/19.
//  Copyright © 2019 Nic Manoogian. All rights reserved.
//

import UIKit

class SwitchCell: UITableViewCell {
    
    let label: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        return label
    }()
    
    let cellSwitch: UISwitch = {
        let cellSwitch = UISwitch()
        cellSwitch.onTintColor = UIColor.red
        return cellSwitch
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        preservesSuperviewLayoutMargins = true
        contentView.preservesSuperviewLayoutMargins = true
        
        contentView.addSubview(cellSwitch)
        cellSwitch.constraining(.centerY, .equal, to: contentView).isActive = true
        cellSwitch.constraining(.trailing, .equal, to: .trailingMargin, of: contentView).isActive = true
        cellSwitch.constraining(.top, .greaterThanOrEqual, to: .topMargin, of: contentView).isActive = true
        cellSwitch.constraining(.bottom, .lessThanOrEqual, to: .bottomMargin, of: contentView).isActive = true
        cellSwitch.addTarget(self, action: #selector(cellSwitchValueChanged), for: .valueChanged)
        
        contentView.addSubview(label)
        label.constraining(.centerY, .equal, to: contentView,
                           priority: UILayoutPriority(rawValue: 999)).isActive = true
        label.constraining(.leading, .equal, to: .leadingMargin, of: contentView).isActive = true
        label.constraining(.trailing, .equal, to: .leading, of: cellSwitch, constant: -8).isActive = true
        label.constraining(.top, .equal, to: .topMargin, of: contentView).isActive = true
        label.constraining(.bottom, .equal, to: .bottomMargin, of: contentView).isActive = true
        label.setContentCompressionResistancePriority(.required, for: .vertical)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    @objc func cellSwitchValueChanged(_ sender: UISwitch) {
        print("cellSwitchValueChanged")
    }
    
    override func prepareForReuse() {
        self.label.text = ""
        self.cellSwitch.setOn(false, animated: false)
    }
}
