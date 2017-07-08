

import UIKit
import Just
import SwiftyJSON

class FriendsListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {


	@IBOutlet weak var tableViewFriend: UITableView!
	var friendsName : JSON?
	var idSelected = ""

    override func viewDidLoad() {
        super.viewDidLoad()


		self.tableViewFriend.delegate = self
		self.tableViewFriend.dataSource = self
		let req = Just.get("http://192.168.1.201:3000/api/users")
		var jsonData = req.content
		let json = JSON(data: jsonData!)
		self.friendsName = json
		print("friend \(req.json)")
		print("friend \(json)")

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

	override func viewWillAppear(_ animated: Bool) {
		
	}

	override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
		if segue.identifier == "selectName" {
			let detailConrtroller =  segue.destination as! DetailFriendViewController
			detailConrtroller.id = self.idSelected

		}
	}


	// table maneger


	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return self.friendsName!.count
	}

	func numberOfSections(in tableView: UITableView) -> Int {
		return 1
	}

	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let infoCell = tableView.dequeueReusableCell(withIdentifier: "friendsCell", for: indexPath) as! FriendsTableViewCell
		infoCell.friendName.text = self.friendsName![indexPath.row]["full_name"].string

		
		return infoCell
	}

	func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
		return 1
	}

	func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
		return UIView()
	}

	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		self.idSelected = self.friendsName![indexPath.row]["id"].string!

		performSegue(withIdentifier: "selectName", sender: self)
	}

}
