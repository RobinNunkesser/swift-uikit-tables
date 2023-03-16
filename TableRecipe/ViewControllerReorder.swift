//
//  ViewControllerReorder.swift
//  TableRecipe
//
//  Created by Prof. Dr. Nunkesser, Robin on 16.03.23.
//  Copyright © 2023 Hochschule Hamm-Lippstadt. All rights reserved.
//

import UIKit

class ViewControllerReorder : UITableViewController {
    // MARK: - Properties
    
    var items = mockItems
    
    // MARK: - Methods
    // MARK: Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.rightBarButtonItems = [editButtonItem]
    }

    // MARK: UITableViewDataSource
    
    override func tableView(_ tableView: UITableView,
                            numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    override func tableView(_ tableView: UITableView,
                            cellForRowAt indexPath: IndexPath)
                            -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier:
                                                 "SubtitleCell",
                                                 for: indexPath)
        let item = items[indexPath.row]
        cell.textLabel?.text = item.title
        cell.detailTextLabel?.text = item.subtitle
        return cell
    }
    
    override func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .none
    }
    
    // MARK: UITableViewDelegate
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    override func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        items.swapAt(sourceIndexPath.row, destinationIndexPath.row)
        debugPrint(items)
    }
        
}

