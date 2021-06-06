//
//  LocationModel+CoreDataProperties.swift
//  
//
//  Created by Raghul S Nadh on 06/06/21.
//
//  This file was automatically generated and should not be edited.
//

import Foundation
import CoreData


extension LocationModel {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<LocationModel> {
        return NSFetchRequest<LocationModel>(entityName: "LocationModel")
    }

    @NSManaged public var lat: String?
    @NSManaged public var lng: String?
    @NSManaged public var address: AddressModel?

}

extension LocationModel : Identifiable {

}
