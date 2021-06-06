//
//  AddressModel+CoreDataProperties.swift
//  
//
//  Created by Raghul S Nadh on 06/06/21.
//
//  This file was automatically generated and should not be edited.
//

import Foundation
import CoreData


extension AddressModel {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<AddressModel> {
        return NSFetchRequest<AddressModel>(entityName: "AddressModel")
    }

    @NSManaged public var city: String?
    @NSManaged public var street: String?
    @NSManaged public var suite: String?
    @NSManaged public var zipCode: String?
    @NSManaged public var location: LocationModel?
    @NSManaged public var user: UserModel?

}

extension AddressModel : Identifiable {

}
