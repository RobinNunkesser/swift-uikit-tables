//  ViewControllerSearch.swift
//  TableRecipe

import Foundation
import UIKit

class ViewControllerSearch: UITableViewController, UISearchBarDelegate {
        
    // MARK: - Properties
    
    var items = mockItems
        
    var filteredItems : [CellViewModel] = [] {
        didSet {
            self.tableView.reloadData()
        }
    }
    
    // MARK: - Methods
    // MARK: Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.filteredItems = items
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // MARK: UITableViewDataSource
    
    override func tableView(_ tableView: UITableView,
                            numberOfRowsInSection section: Int) -> Int {
        return filteredItems.count
    }
    
    override func tableView(_ tableView: UITableView,
                            cellForRowAt indexPath: IndexPath)
        -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier:
                "SubtitleCell",
                                                     for: indexPath)
            let item = filteredItems[indexPath.row]
            cell.textLabel?.text = item.title
            cell.detailTextLabel?.text = item.subtitle
            return cell
    }
    
    // MARK: - UISearchBarDelegate
    
    func searchBar(_ searchBar: UISearchBar,
                   textDidChange searchText: String) {
        if searchText.isEmpty {
            filteredItems = items
        } else {
            let titleExpression = NSExpression(forKeyPath: "title")
            let searchStringExpression = NSExpression(forConstantValue:
                                                      searchText)
            let titleSearchComparisonPredicate = NSComparisonPredicate(
                    leftExpression: titleExpression,
                    rightExpression: searchStringExpression,
                    modifier: .direct,
                    type: .contains,
                    options: .caseInsensitive)
            filteredItems = items.filter {
                titleSearchComparisonPredicate.evaluate(with: $0)
            }
        }
    }

}
