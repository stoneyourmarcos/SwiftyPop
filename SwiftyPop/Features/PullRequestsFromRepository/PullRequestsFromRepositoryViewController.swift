import UIKit
import SafariServices

class PullRequestsFromRepositoryViewController: UITableViewController {
    
    fileprivate var pullRequests: [PullRequestsFromRepository] = [] {
        didSet {
            tableView.reloadData()
        }
    }
    
    var ownerPullRequest: String?
    var repositoryPullRequest: String?
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        title = repositoryPullRequest
        fetchPullRequestsFromRepository()
    }
}

// MARK: - Table view data source

extension PullRequestsFromRepositoryViewController {
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pullRequests.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PullRequestsFromRepositoryCell",
                                                 for: indexPath) as! PullRequestsFromRepositoryCell
        let request = pullRequests[indexPath.row]
        cell.config(withViewModel: PullRequestsFromRepositoryCellViewModel(withPullRequest: request))
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let urlString: String = pullRequests[indexPath.row].pullRequestURL
        guard let url = URL(string: urlString) else { return }
        let svc = SFSafariViewController(url: url)
        self.present(svc, animated: true, completion: nil)
    }
}

// MARK: - Methods

extension PullRequestsFromRepositoryViewController {
    
    func fetchPullRequestsFromRepository(){
        guard let ownerPullRequest = ownerPullRequest,
            let repositoryPullRequest = repositoryPullRequest else { return }
        
        APIManager.fetchPullRequestFromRepository(owner: ownerPullRequest, repository: repositoryPullRequest)
            .then { pullRequests -> Void in
                self.pullRequests = pullRequests
            } .catch { error in
                print(error)
        }
    }
}
