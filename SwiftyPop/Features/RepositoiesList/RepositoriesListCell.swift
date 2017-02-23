import UIKit
import SDWebImage

class RepositoriesListCell: UITableViewCell {
    
    // MARK: - Properties
    
    @IBOutlet weak var repositoryNameLabel: UILabel!
    @IBOutlet weak var repositoryDescriptionLabel: UILabel!
    @IBOutlet weak var repositoryForksCountLabel: UILabel!
    @IBOutlet weak var repositoryStarsCountLabel: UILabel!
    @IBOutlet weak var repositoryOwnerLabel: UILabel!
    @IBOutlet weak var repositoryOwnerAvatarImage: UIImageView!
}

extension RepositoriesListCell {
    
    func config(withViewModel viewModel: RepositoriesListCellViewModel) {
        repositoryNameLabel.text = viewModel.name
        repositoryDescriptionLabel.text = viewModel.description
        repositoryForksCountLabel.text = "\(viewModel.forksCount!)"
        repositoryStarsCountLabel.text = "\(viewModel.starsCount!)"
        repositoryOwnerLabel.text = viewModel.owner
        repositoryOwnerAvatarImage.sd_setImage(with: viewModel.ownerAvatarImage)
    }
}
