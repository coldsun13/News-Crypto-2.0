//
//  Account+CoreDataProperties.swift
//  
//
//  Created by Игорь Тимофеев on 3.08.23.
//
//

import Foundation
import CoreData


extension Account {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Account> {
        return NSFetchRequest<Account>(entityName: "Account")
    }

    @NSManaged public var country: String?
    @NSManaged public var email: String?
    @NSManaged public var image: Data?
    @NSManaged public var name: String?
    @NSManaged public var phoneNumber: String?

}
