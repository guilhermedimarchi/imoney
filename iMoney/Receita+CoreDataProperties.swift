//
//  Receita+CoreDataProperties.swift
//  iMoney
//
//  Created by Student on 7/19/16.
//  Copyright © 2016 Student. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

extension Receita {

    @NSManaged var data: NSDate?
    @NSManaged var nome: String?
    @NSManaged var valor: NSNumber?

}
