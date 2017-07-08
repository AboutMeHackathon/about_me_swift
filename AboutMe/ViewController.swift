

import UIKit
import Just

class ViewController: UIViewController {

	@IBOutlet weak var loginButton: UIButton!
	@IBOutlet weak var userTextField: UITextField!
	@IBOutlet weak var passwordTextField: UITextField!
	var currentUsername = ""
	var currentUserID = ""

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

	override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

		if segue.identifier == "doLogin" {
			let defaults = UserDefaults.standard
			defaults.set(self.currentUserID, forKey: "userID")
			defaults.set(self.currentUsername, forKey: "userName")
			defaults.set("yes", forKey: "log")
		}
	}

	override func viewWillAppear(_ animated: Bool) {

		let defaults = UserDefaults.standard
		let userId = defaults.string(forKey: "log") ?? ""

		if userId == "yes" {
			self.performSegue(withIdentifier: "doLogin", sender: self)
		}


		self.passwordTextField.text = ""
		self.userTextField.text = ""
	}

	@IBAction func doLogin(_ sender: Any) {

		Just.post(
			"http://192.168.1.201:3000/api/session/new",
			data: ["Email": self.userTextField.text ?? "", "Password":self.passwordTextField.text ?? ""]
		) { r in
			print("json \(r.json)")
			if r.json != nil {
				OperationQueue.main.addOperation {
					var json = r.json as? [String : String]
					self.currentUserID = json!["id"]!
					self.currentUsername = json!["full_name"]!
					self.performSegue(withIdentifier: "doLogin", sender: self)
				}


			}

		}


	}


}
