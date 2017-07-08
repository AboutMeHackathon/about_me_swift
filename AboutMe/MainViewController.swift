

import UIKit

class MainViewController: UIViewController {

	@IBOutlet weak var infoListViewController: UIView!
	@IBOutlet weak var FriendsListViewController: UIView!
	@IBOutlet weak var homeItemButton: UIBarButtonItem!
	@IBOutlet weak var friendsItemButton: UIBarButtonItem!


    override func viewDidLoad() {
        super.viewDidLoad()
		self.FriendsListViewController.isHidden = true

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

    }
    
	@IBAction func goInfoView(_ sender: Any) {
		UIView.animate(withDuration: 0.5, animations: {
			self.infoListViewController.alpha = 1
			self.FriendsListViewController.alpha = 0
		})
	}

	@IBAction func goFriendsView(_ sender: Any) {
		UIView.animate(withDuration: 0.5, animations: {
			self.FriendsListViewController.isHidden = false
			self.infoListViewController.alpha = 0
			self.FriendsListViewController.alpha = 1
		})
	}

	@IBAction func logout(_ sender: Any) {
		dismiss(animated: true, completion: nil)
	}


}
