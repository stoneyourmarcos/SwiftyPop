import Unbox

public struct RepositoriesList {
    let repositoryName: String
    let repositoryDescription: String
    let repositoryOwnerName: String
    let repositoryOwnerAvatar: String
    let repositoryStarsCount: Int
    let repositoryForksCount: Int
}

extension RepositoriesList: Unboxable {
    public init(unboxer: Unboxer) throws {
        self.repositoryName = try unboxer.unbox(key: "name")
        self.repositoryDescription = try unboxer.unbox(key: "description")
        self.repositoryOwnerName = try unboxer.unbox(keyPath: "owner.login")
        self.repositoryOwnerAvatar = try unboxer.unbox(keyPath: "owner.avatar_url")
        self.repositoryStarsCount = try unboxer.unbox(key: "stargazers_count")
        self.repositoryForksCount = try unboxer.unbox(key: "forks_count")
    }
}
