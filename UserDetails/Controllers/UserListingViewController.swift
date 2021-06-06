//
//  UserListingViewController.swift
//  UserDetails
//
//  Created by Raghul S Nadh on 06/06/21.
//

import UIKit

class UserListingViewController: UIViewController {

    @IBOutlet weak var userTableView: UITableView!

    var viewManager = ViewManager()

    override func viewDidLoad() {
        super.viewDidLoad()
        userTableView.tableFooterView = UIView()
        userTableView.separatorColor = .clear
        viewManager.delegate = self
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.title = "User List"
        viewManager.getUserList()
    }

}

extension UserListingViewController: UITableViewDelegate, UITableViewDataSource {


    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewManager.getUserCount()
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:UserTableViewCell   = tableView.dequeueReusableCell(withIdentifier: "UserTableViewCell") as! UserTableViewCell
        if let user = viewManager.getUserATIndex(indexPath.row) {
            cell.configureData(user.name, user.phone)
        }

        return cell
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }

    func  tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        guard let user = viewManager.getUserATIndex(indexPath.row) else {return}
        let userDetailsVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "UserDetailsViewController") as! UserDetailsViewController
        userDetailsVC.user = user
        self.navigationController?.pushViewController(userDetailsVC, animated: true)

    }

}

extension UserListingViewController: ViewManagerDelegate {
    func refreshData() {
        userTableView.reloadData()
    }
}
