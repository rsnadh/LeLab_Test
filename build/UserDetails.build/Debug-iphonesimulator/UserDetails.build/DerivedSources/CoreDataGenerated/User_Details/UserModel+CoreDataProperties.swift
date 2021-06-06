//
//  UserModel+CoreDataProperties.swift
//  
//
//  Created by Raghul S Nadh on 06/06/21.
//
//  This file was automatically generated and should not be edited.
//

import Foundation
import CoreData


extension UserModel {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<UserModel> {
        return NSFetchRequest<UserModel>(entityName: "UserModel")
    }

    @NSManaged public var email: String?
    @NSManaged public var id: Int32
    @NSManaged public var name: String?
    @NSManaged public var phone: String?
    @NSManaged public var userName: String?
    @NSManaged public var website: String?
    @NSManaged public var address: AddressModel?
    @NSManaged public var company: CompanyModel?

}

extension UserModel : Identifiable {

}
