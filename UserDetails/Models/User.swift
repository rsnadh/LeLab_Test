//
//  User.swift
//  UserDetails
//
//  Created by Raghul S Nadh on 06/06/21.
//

import UIKit

class User: Codable  {
    var id:Int32
    var name: String
    var username: String
    var email: String
    var address: Address
    var phone: String
    var website: String
    var company: Company

    init(_ user: UserModel) {
        self.id = user.id
        self.name = user.name!
        self.username = user.userName!
        self.email = user.email!
        self.address = Address(user.address!)
        self.phone = user.phone!
        self.website = user.website!
        self.company = Company(user.company!)
    }
}

class Address: Codable {
    var street: String
    var suite: String
    var city: String
    var zipcode: String
    var geo: Location

    init(_ address: AddressModel) {
        self.street = address.street!
        self.suite = address.suite!
        self.city = address.city!
        self.zipcode = address.zipCode!
        self.geo = Location(address.location!)
    }
}

class Company: Codable {
    var name: String
    var catchPhrase: String
    var bs: String

    init(_ company: CompanyModel) {
        self.name = company.name!
        self.catchPhrase = company.catchPhrase!
        self.bs = company.bs!
    }
}
class Location: Codable {
    var lat: String
    var lng: String

    init(_ location: LocationModel) {
        self.lat = location.lat!
        self.lng = location.lng!
    }
}
