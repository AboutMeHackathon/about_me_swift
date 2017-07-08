

import UIKit
import Just
import SwiftyJSON

class InfoListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

	@IBOutlet weak var infoTableView: UITableView!
	var userId : String = ""
	var infoList : JSON?
	var name = ""

    override func viewDidLoad() {
        super.viewDidLoad()
		self.infoTableView.delegate = self
		self.infoTableView.dataSource = self
		let defaults = UserDefaults.standard
		self.userId = defaults.string(forKey: "userID")!
		self.name = defaults.string(forKey: "userName")!
		self.getListInfo()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

	override func viewWillAppear(_ animated: Bool) {
			
	}

	func getListInfo() {
		let req = Just.get("http://192.168.1.201:3000/api/get_entries", params: ["user_id": self.userId])
		var jsonData = req.content
		let json = JSON(data: jsonData!)

		self.infoList = json


		print("jsonget \(self.infoList!)")
//		self.label.text = json!["Name"]
	}




	//TableViewManager

	func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
		let section = indexPath.section
		if section == 0 {
			return 90
		} else {
			return 84
		}
	}

	func numberOfSections(in tableView: UITableView) -> Int {
		return 2
	}

	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		if section == 0 {
			return self.infoList!.count
		} else {
			return 1
		}
	}

	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let section = indexPath.section
		if section == 0 {
			let infoCell = tableView.dequeueReusableCell(withIdentifier: "infoTableViewCell", for: indexPath) as! InfoTableViewCell
			infoCell.key.text = self.infoList![indexPath.row]["key"].string
			infoCell.value.text = self.infoList![indexPath.row]["value"].string
			infoCell.category.text = self.infoList![indexPath.row]["category"].string
			return infoCell
		} else {
			let addCell = tableView.dequeueReusableCell(withIdentifier: "addInfoTableViewCell", for: indexPath) as! AddInfoTableViewCell

			return addCell
		}
	}

	func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
		return 1
	}

	func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
		return UIView()
	}

	func tableView(_ tableView: UITableView, titleForFooterInSection section: Int) -> String? {
		if section == 1 {
			return "Add new Info About you"
		} else {
			return "11111"
		}
	}

	func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
		if section == 1 {
			return "Add some about you"
		} else {
			return self.name
		}
	}

	func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
		if section == 1 {
			return 40.0
		} else {
			return 40.0
		}

	}


}
