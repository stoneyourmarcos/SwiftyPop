import UIKit
import SDWebImage

class PullRequestsFromRepositoryCell: UITableViewCell {
    
    // MARK: - Properties
    
    @IBOutlet weak var pullRequestTitleLabel: UILabel!
    @IBOutlet weak var pullRequestBodyLabel: UILabel!
    @IBOutlet weak var pullRequestDateLabel: UILabel!
    @IBOutlet weak var pullRequestAuthorsNameLabel: UILabel!
    @IBOutlet weak var pullRequestAuthorsAvatarImage: UIImageView!
    
}

extension PullRequestsFromRepositoryCell {
    
    func config(withViewModel viewModel: PullRequestsFromRepositoryCellViewModel) {
        pullRequestTitleLabel.text = viewModel.title
        pullRequestBodyLabel.text = viewModel.body
        pullRequestDateLabel.text = viewModel.date
        pullRequestAuthorsNameLabel.text = viewModel.authorsName
        pullRequestAuthorsAvatarImage.sd_setImage(with: viewModel.authorsAvatarImage)
    }
}
