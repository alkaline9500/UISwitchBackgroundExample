//
//  ViewController.swift
//  UISwitchBackgroundExample
//
//  Created by Nicolas Manoogian on 7/3/19.
//  Copyright © 2019 Nic Manoogian. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.estimatedRowHeight = 60
        self.tableView.rowHeight = UITableView.automaticDimension
        self.tableView.register(SwitchCell.self, forCellReuseIdentifier: "SwitchCell")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2, execute: {
            self.tableView.reloadData()
        })
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SwitchCell", for: indexPath) as! SwitchCell
        cell.accessoryType = .disclosureIndicator
        cell.label.text = "Item \(indexPath.row)"
        cell.cellSwitch.setOn(indexPath.row % 2 == 0, animated: false)
        cell.layoutIfNeeded()
        return cell
    }
}
