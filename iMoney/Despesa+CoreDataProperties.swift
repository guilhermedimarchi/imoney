//
//  Despesa+CoreDataProperties.swift
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

extension Despesa {

    @NSManaged var categoria: String?
    @NSManaged var data: NSDate?
    @NSManaged var local: String?
    @NSManaged var nome: String?
    @NSManaged var parcelaAtual: NSNumber?
    @NSManaged var parcelaTotal: NSNumber?
    @NSManaged var valor: NSNumber?

}
