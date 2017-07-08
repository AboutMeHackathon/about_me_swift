

import UIKit
import SwiftyJSON
import Just

class DetailFriendViewController: UIViewController {
	@IBOutlet weak var detailNAmeFriend: UILabel!
	var id = ""

    override func viewDidLoad() {
        super.viewDidLoad()

		let req = Just.get("http://192.168.1.201:3000/api/users/\(self.id)/show")
		var jsonData = req.content
		let json = JSON(data: jsonData!)
		self.detailNAmeFriend.text = json["friend"].string
		print("detaild \(json)")

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
