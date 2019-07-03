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
        self.tableView.register(SwitchCell.self, forCellReuseIdentifier: "SwitchCell")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        // DEBUG: This is intended to simulate a network call to re-sync the data if it's stale.
        // Removing this reload make the problem unreproducible
        DispatchQueue.global().asyncAfter(deadline: .now() + 0.1) {
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SwitchCell", for: indexPath) as! SwitchCell
        print("cellForRowAt: \(indexPath.row) :: \(cell)")
        cell.accessoryType = .disclosureIndicator
        cell.cellSwitch.setOn(indexPath.row < 5, animated: false)
        return cell
    }
}
