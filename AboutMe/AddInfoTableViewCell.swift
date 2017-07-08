
import UIKit

class AddInfoTableViewCell: UITableViewCell {

	@IBOutlet weak var keyTextField: UITextField!
	@IBOutlet weak var valueTextField: UITextField!
	@IBOutlet weak var addButton: UIButton!


    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
