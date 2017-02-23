import Unbox
import Foundation

public struct PullRequestsFromRepository {
    let pullRequestAuthorsName: String
    let pullRequestAuthorsAvatar: String
    let pullRequestTitle: String
    let pullRequestDate: Date
    let pullRequestBody: String
    let pullRequestURL: String
}

extension PullRequestsFromRepository: Unboxable {
    public init(unboxer: Unboxer) throws {
        self.pullRequestAuthorsName = try unboxer.unbox(keyPath: "user.login")
        self.pullRequestAuthorsAvatar = try unboxer.unbox(keyPath: "user.avatar_url")
        self.pullRequestTitle = try unboxer.unbox(keyPath: "title")
        self.pullRequestBody = try unboxer.unbox(keyPath: "body")
        self.pullRequestURL = try unboxer.unbox(keyPath: "html_url")
        
        //Date Formatter
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        self.pullRequestDate = try unboxer.unbox(key: "updated_at", formatter: dateFormatter)
    }
}
