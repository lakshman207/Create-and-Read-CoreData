//
//  User+CoreDataProperties.swift
//  Create and Read CoreData
//
//  Created by Home Computer on 04/12/2019.
//  Copyright © 2019 Home Computer. All rights reserved.
//
//

import Foundation
import CoreData


extension User {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<User> {
        return NSFetchRequest<User>(entityName: "User")
    }

    @NSManaged public var name: String

}
