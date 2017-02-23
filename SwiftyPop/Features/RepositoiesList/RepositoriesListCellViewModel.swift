import Foundation

struct RepositoriesListCellViewModel {
    
    let name: String?
    let description: String?
    let owner: String?
    let ownerAvatarImage: URL?
    let forksCount: Int?
    let starsCount: Int?
    
    init(withRepository repository: RepositoriesList) {
        name = repository.repositoryName
        description = repository.repositoryDescription
        forksCount = repository.repositoryForksCount
        starsCount = repository.repositoryStarsCount
        owner = repository.repositoryOwnerName
        ownerAvatarImage = URL(string: "\(repository.repositoryOwnerAvatar)")!
    }
}
