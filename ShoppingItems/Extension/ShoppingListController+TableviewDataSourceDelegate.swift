//
//  ShoppingListController+TableviewDataSourceDelegate.swift
//  ShoppingItems
//
//  Created by Bharatraj Rai on 4/16/20.
//  Copyright © 2020 Bharatraj Rai. All rights reserved.
//

import Foundation
import UIKit

extension ShoppingListController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return garments.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath)
        cell.textLabel?.text = garments[indexPath.row].itemName
        return cell
    }
}
