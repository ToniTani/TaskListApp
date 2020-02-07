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
    
    static let shared = CoreDataManager(moc: NSManagedObjectContext.current)
    
    var moc: NSManagedObjectContext
    
    private init(moc: NSManagedObjectContext) {
    self.moc = moc
    }
    
    private func fetchTask(name: String) -> Task? {
        
        var tasks = [Task]()
        
        let request: NSFetchRequest<Task> = Task.fetchRequest()
        request.predicate = NSPredicate(format: "name == %@", name)
        
        do {
            tasks = try self.moc.fetch(request)
        } catch let error as NSError {
            print(error)
        }
        
        return tasks.first
        
    }
    func getAllTasks() -> [Task] {
        
        var tasks = [Task]()
        
        let taskRequest: NSFetchRequest<Task> = Task.fetchRequest()
        
        do {
            tasks = try self.moc.fetch(taskRequest)
        } catch let error as NSError {
            print(error)
        }
        
        return tasks
        
    }
    func deleteTask(name: String) {
        
        do {
            if let task = fetchTask(name: name) {
                self.moc.delete(task)
                try self.moc.save()
            }
        } catch let error as NSError {
            print(error)
        }
        
    }
    
    
    func saveTask(name: String, type:String) {
        let task = Task(context: self.moc)
        task.name = name
        task.type = type
        
        do {
            try self.moc.save()
        } catch let error as NSError {
            print(error)
        }
    }
    
}
