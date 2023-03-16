//  ViewController.swift
//  TableRecipe

import UIKit

class ViewController: UITableViewController {
    
    // MARK: - Properties
    
    var items = mockItems
    
    // MARK: - Methods
    // MARK: Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
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
}

