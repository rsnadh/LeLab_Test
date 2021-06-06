//
//  ViewManager.swift
//  UserDetails
//
//  Created by Raghul S Nadh on 06/06/21.
//

import UIKit
import Alamofire

protocol ViewManagerDelegate: class {
    func refreshData()
}

class ViewManager: NSObject {

    var users = [User]()
    var delegate: ViewManagerDelegate!

    func getUserCount() -> Int {
        return users.count
    }

    func getUserATIndex(_ index: Int) -> User? {
        if index < users.count {
            return users[index]
        } else {
            return nil
        }

    }

    func getUserList() {
        getUserDetails()
        AF.request(ApiUrls.BASE_URL + ApiUrls.USERS, method: .get, encoding: JSONEncoding.default).responseString { (output) in
            do {
                if output.data != nil {
                    let users = try JSONDecoder().decode([User].self, from: output.data!)
                    self.saveUserDetails(users)
                }
            } catch {
                print(error)
            }
        }
    }

    func getUserDetails() {
        users.removeAll()
        let userList = DataBaseManager.shared.fetchObjectList(entity: "UserModel") as? [UserModel]
        guard let allUser = userList else {return}
        for user in allUser {
            users.append(User(user))
        }

        guard let viewManagerDelegate = delegate else {return}
        viewManagerDelegate.refreshData()
    }

    func saveUserDetails(_ users: [User]) {
        for user in users {
            let predicate = NSPredicate(format: "(id == %d)", user.id)
            var  userModel = DataBaseManager.shared.fetchObject(entity: "UserModel", predicate: predicate) as? UserModel

            if(userModel == nil) {
                userModel = (DataBaseManager.shared.createObjectForEntity(entityName: "UserModel") as! UserModel)
            }

            userModel!.id = user.id
            userModel!.name = user.name
            userModel!.userName = user.username
            userModel!.email = user.email
            userModel!.phone = user.phone
            userModel!.website = user.website

            let userPredicate = NSPredicate(format: "user == %@", userModel!)
            var addressModel = DataBaseManager.shared.fetchObject(entity: "AddressModel", predicate: userPredicate) as? AddressModel
            var companyModel = DataBaseManager.shared.fetchObject(entity: "CompanyModel", predicate: userPredicate) as? CompanyModel

            if(addressModel == nil) {
                addressModel = (DataBaseManager.shared.createObjectForEntity(entityName: "AddressModel") as! AddressModel)
            }

            if(companyModel == nil) {
                companyModel = (DataBaseManager.shared.createObjectForEntity(entityName: "CompanyModel") as! CompanyModel)
            }

            let addressPredicate = NSPredicate(format: "address == %@", addressModel!)
            var locationModel = DataBaseManager.shared.fetchObject(entity: "LocationModel", predicate: addressPredicate) as? LocationModel

            if(locationModel == nil) {
                locationModel = (DataBaseManager.shared.createObjectForEntity(entityName: "LocationModel") as! LocationModel)
            }

            addressModel!.street = user.address.street
            addressModel!.suite = user.address.suite
            addressModel!.city = user.address.city
            addressModel!.zipCode = user.address.zipcode
            addressModel!.street = user.address.street
            addressModel!.user = userModel

            locationModel!.lat = user.address.geo.lat
            locationModel!.lng = user.address.geo.lng
            locationModel!.address = addressModel

            companyModel!.name = user.company.name
            companyModel!.catchPhrase = user.company.catchPhrase
            companyModel!.bs = user.company.bs
            companyModel!.user = userModel

        }

        DataBaseManager.shared.dbSave()
        getUserDetails()
    }
}
