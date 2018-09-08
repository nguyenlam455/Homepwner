//
//  ItemStore.swift
//  Homepwner
//
//  Created by Nguyen Lam on 9/8/18.
//  Copyright © 2018 Nguyen Lam. All rights reserved.
//

import UIKit

class ItemStore {
    var allItems = [Item]()
    
    // create a random item
    @discardableResult func createItem() -> Item {
        let newItem = Item(random: true)
        allItems.append(newItem)
        return newItem
    }
    // initializer, automatically create 5 items
    init() {
        for _ in 0..<5 {
            createItem()
        }
    }
    
}

