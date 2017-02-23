import UIKit
import PromiseKit

class RepositoriesListViewController: UITableViewController {
    
    fileprivate var repositoriesList: [RepositoriesList] = [] {
        didSet {
            tableView.reloadData()
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        fetchRepositoriesList()
    }
}

// MARK - TableView Data Source

extension RepositoriesListViewController {
    override public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return repositoriesList.count
    }
    
    override public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "RepositoriesListCell", for: indexPath) as! RepositoriesListCell
        let repository = repositoriesList[indexPath.row]
        cell.config(withViewModel: RepositoriesListCellViewModel(withRepository: repository))
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let indexPath = tableView.indexPathForSelectedRow,
            let destination = segue.destination as? PullRequestsFromRepositoryViewController else { return }
        let owner = repositoriesList[indexPath.row].repositoryOwnerName
        let repository = repositoriesList[indexPath.row].repositoryName
        destination.ownerPullRequest = owner
        destination.repositoryPullRequest = repository
    }
}

// MARK - Data Fetching

extension RepositoriesListViewController {
    
    func fetchRepositoriesList() {
        APIManager.fetchPopSwiftRepositoriesList().then { repositories -> Void in
            self.repositoriesList = repositories
            }
            .catch { error in
                print(error)
            }
    }
}
