//
//  CompanyModel+CoreDataProperties.swift
//  
//
//  Created by Raghul S Nadh on 06/06/21.
//
//  This file was automatically generated and should not be edited.
//

import Foundation
import CoreData


extension CompanyModel {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CompanyModel> {
        return NSFetchRequest<CompanyModel>(entityName: "CompanyModel")
    }

    @NSManaged public var bs: String?
    @NSManaged public var catchPhrase: String?
    @NSManaged public var name: String?
    @NSManaged public var user: UserModel?

}

extension CompanyModel : Identifiable {

}
