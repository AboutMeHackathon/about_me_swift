

import UIKit

class InfoTableViewCell: UITableViewCell {

	@IBOutlet weak var key: UILabel!
	@IBOutlet weak var value: UILabel!
	@IBOutlet weak var category: UILabel!


	var something:Int = 1

	
    override func awakeFromNib() {
        super.awakeFromNib()

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }

}
