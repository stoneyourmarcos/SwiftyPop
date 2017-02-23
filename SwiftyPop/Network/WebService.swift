import Foundation
import Moya

public enum WebService {
    case fetchPopSwiftRepositoriesList
    case fetchPullRequestFromRepository(owner: String, repository: String)
}

extension WebService: TargetType {
    public var baseURL: URL { return URL(string: "https://api.github.com")!}
    
    public var path: String {
        switch self {
        case .fetchPopSwiftRepositoriesList:
            return "/search/repositories"
        case . fetchPullRequestFromRepository(let owner, let repository):
            return "/repos/\(owner)/\(repository)/pulls"
        }
    }
    
    public var method: Moya.Method {
        return .get
    }
    
    public var parameters: [String: Any]? {
        switch self {
        case .fetchPopSwiftRepositoriesList():
            return ["q":"language:swift", "sort":"stars", "?page":""]
        default:
            return nil
        }
    }
    
    public var parameterEncoding: ParameterEncoding {
        return URLEncoding.default
    }
    
    public var sampleData: Data {
        return Data()
    }
    
    public var task: Task {
        return .request
    }
}
