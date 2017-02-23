import Foundation

struct PullRequestsFromRepositoryCellViewModel {
    
    let title: String?
    let body: String?
    let date: String?
    let authorsName: String
    let authorsAvatarImage: URL
    
    init(withPullRequest pullRequest: PullRequestsFromRepository) {
        title = pullRequest.pullRequestTitle
        body = pullRequest.pullRequestBody
        date = pullRequest.pullRequestDate.ddmmyyyFormatted()
        authorsName = pullRequest.pullRequestAuthorsName
        authorsAvatarImage = URL(string: "\(pullRequest.pullRequestAuthorsAvatar)")!
    }
}
