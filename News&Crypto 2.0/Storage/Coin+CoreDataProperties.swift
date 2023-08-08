//
//  Coin+CoreDataProperties.swift
//  
//
//  Created by Игорь Тимофеев on 5.08.23.
//
//

import Foundation
import CoreData


extension Coin {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Coin> {
        return NSFetchRequest<Coin>(entityName: "Coin")
    }

    @NSManaged public var coinSymbol: String?

}
