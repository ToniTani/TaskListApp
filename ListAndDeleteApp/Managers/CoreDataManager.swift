//
//  CoreDataManager.swift
//  ListAndDeleteApp
//
//  Created by Toni Tani on 3.2.2020.
//  Copyright © 2020 Toni Tani. All rights reserved.
//

import Foundation
import CoreData

class CoreDataManager {
    var moc: NSManagedObjectContext
    
    private init(moc: NSManagedObjectContext) {
    self.moc = moc
    }
}
