//
//  ItemsViewController.swift
//  Homepwner
//
//  Created by Nguyen Lam on 9/8/18.
//  Copyright © 2018 Nguyen Lam. All rights reserved.
//

import UIKit

class ItemsViewController: UITableViewController {

    var itemStore: ItemStore!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // content inset
        let statusBarHeight = UIApplication.shared.statusBarFrame.height
        let insets = UIEdgeInsets(top: statusBarHeight, left: 0, bottom: 0, right: 0)
        tableView.contentInset = insets
        tableView.scrollIndicatorInsets = insets
        
    }


}

extension ItemsViewController {
    // number of section
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    // title for section
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        var sectionName = ""
        switch section {
        case 0:
            sectionName = "> 50$"
        default:
            sectionName = "The rest"
        }
        return sectionName
        
    }
    // number of row
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return itemStore.highValueItems.count
        } else {
            return itemStore.theRest.count
        }
    }
    // height for row
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    // cell for row
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        //let cell = UITableViewCell(style: .value1, reuseIdentifier: "UITableViewCell")
        let cell = tableView.dequeueReusableCell(withIdentifier: "UITableViewCell", for: indexPath)
        
        var items: [Item]
        switch indexPath.section {
        case 0:
            items = itemStore.highValueItems
        default:
            items = itemStore.theRest
        }
        let item = items[indexPath.row]
        cell.textLabel?.text = item.name
        cell.detailTextLabel?.text = "$\(item.valueInDollars)"
        cell.textLabel?.font = UIFont.systemFont(ofSize: 20)
        cell.detailTextLabel?.font = UIFont.systemFont(ofSize: 20)
        
        return cell
    }
}
