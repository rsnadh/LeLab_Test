//
//  UserTableViewCell.swift
//  UserDetails
//
//  Created by Raghul S Nadh on 06/06/21.
//

import UIKit

class UserTableViewCell: UITableViewCell {

    @IBOutlet weak var namelabel: UILabel!
    @IBOutlet weak var phonelabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        self.selectionStyle = .none
        self.layer.masksToBounds = true
        self.layer.cornerRadius = 5
        self.layer.borderWidth = 2
        self.layer.shadowOffset = CGSize(width: -1, height: 1)
        self.layer.borderColor = UIColor.gray.cgColor
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

    func configureData(_ name:String, _ phoneNumber:String) {
        namelabel.text = name
        phonelabel.text = phoneNumber
    }

}
