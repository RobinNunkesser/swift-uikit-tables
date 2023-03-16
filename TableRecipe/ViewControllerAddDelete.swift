import UIKit

class ViewControllerAddDelete: UITableViewController {

    // MARK: - Properties
    var items : [CellViewModel] = [] {
        didSet {
            self.tableView.reloadData()
        }
    }
    
    // MARK: - Methods
    // MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.rightBarButtonItems?.append(editButtonItem)
    }
    
    // MARK: IBActions
    @IBAction func addItem(_ sender: UIBarButtonItem) {
        items.append(CellViewModel(title: "Title",
                               subtitle: UUID().uuidString))
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
                                "SubtitleCell", for: indexPath)
            let item = items[indexPath.row]
            cell.textLabel?.text = item.title
            cell.detailTextLabel?.text = item.subtitle
            return cell
    }
    
    // MARK: UITableViewDelegate
    override func tableView(_ tableView: UITableView,
                            commit editingStyle: UITableViewCell.EditingStyle,
                            forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            items.remove(at: indexPath.row)
        }
    }
}
