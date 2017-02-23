import Foundation
import Moya
import Unbox
import PromiseKit

public class APIManager {}

// MARK: - RepositoriesList

extension APIManager {
    
    public class func fetchPopSwiftRepositoriesList() -> Promise<[RepositoriesList]> {
        return Promise { fulfill, reject in
            apiProvider.request(.fetchPopSwiftRepositoriesList) { result in
                switch result {
                    case let .success(response):
                        do {
                            let data = response.data
                            let json = try JSONSerialization.jsonObject(with: data,
                                                                        options: .mutableContainers)
                            let repository: [RepositoriesList] = try
                                unbox(dictionary: json as! UnboxableDictionary,
                                      atKey: "items")
                            return fulfill(repository)
                        }
                        catch let error {
                            return reject (error)
                        }
                    case .failure(_):
                        return reject(NetworkResult.linkError)
                }
            }
        }
    }
}

// MARK: - Repository Pull Requests

extension APIManager {
    
    public class func fetchPullRequestFromRepository(owner: String, repository: String) ->
        Promise<[PullRequestsFromRepository]> {
        return Promise { fulfill, reject in
            apiProvider.request(
            .fetchPullRequestFromRepository(owner: owner, repository: repository)) {
                result in
                switch result {
                case let .success(response):
                    let statusCode = response.statusCode
                    if (statusCode >= 200 && statusCode < 300) {
                        var pullRequests: [PullRequestsFromRepository]?
                        do {
                            pullRequests = try unbox(data: response.data)
                        } catch let error {
                            reject(error)
                            return
                        }
                        fulfill(pullRequests!)
                    }
                    else {
                        return reject(NetworkResult.failToParseResponse)
                    }
                case .failure(_):
                    reject(NetworkResult.linkError)
                }
            }
        }
    }
}
