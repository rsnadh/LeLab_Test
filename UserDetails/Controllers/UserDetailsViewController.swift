//
//  UserDetailsViewController.swift
//  UserDetails
//
//  Created by Raghul S Nadh on 06/06/21.
//

import UIKit

class UserDetailsViewController: UIViewController {

    var user:User!

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var phoneLabel: UILabel!
    @IBOutlet weak var websiteLabel: UILabel!
    @IBOutlet weak var streetLabel: UILabel!
    @IBOutlet weak var suitLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var zipcodeLabel: UILabel!
    @IBOutlet weak var companyNameLabel: UILabel!
    @IBOutlet weak var catchPhraseLabel: UILabel!
    @IBOutlet weak var bsLabel: UILabel!


    override func viewDidLoad() {
        super.viewDidLoad()
        setUpUserDetails()
    }
    

    func setUpUserDetails() {
        guard let currentUser = user else {return}
        self.title = currentUser.name
        nameLabel.text =     "Name : " + currentUser.name
        userNameLabel.text = "User Name : " + currentUser.username
        emailLabel.text =    "Email : " + currentUser.email
        phoneLabel.text =    "Phone : " + currentUser.phone
        websiteLabel.text =  "Website : " + currentUser.website
        streetLabel.text =   "Street : " + currentUser.address.street
        suitLabel.text =     "Suite : " + currentUser.address.suite
        cityLabel.text =     "City : " + currentUser.address.city
        zipcodeLabel.text =  "Zip : " + currentUser.address.zipcode
        companyNameLabel.text = "Company Name : " + currentUser.company.name
        catchPhraseLabel.text = "Catch Phrase : " + currentUser.company.catchPhrase
        bsLabel.text =          "BS : " + currentUser.company.bs
    }

}
