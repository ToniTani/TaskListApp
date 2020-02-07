//
//  TaskListViewModel.swift
//  ListAndDeleteApp
//
//  Created by Toni Tani on 7.2.2020.
//  Copyright © 2020 Toni Tani. All rights reserved.
//

import Foundation
import SwiftUI
import CoreData
import Combine

class TaskListViewModel: ObservableObject {
    
    @Published
    var tasks = [TaskViewModel]()
    
    init() {
        fetchAllTasks()
    }
    
    func deleteTask(_ taskVM: TaskViewModel) {
            CoreDataManager.shared.deleteTask(name: taskVM.name)
            fetchAllTasks()
        }
        
        func fetchAllTasks() {
            self.tasks = CoreDataManager.shared.getAllTasks().map(TaskViewModel.init)
            print(self.tasks)
        }
    }
class TaskViewModel {
    
    var name = ""
    var type = ""
    
    init(task: Task) {
        self.name = task.name!
        self.name = task.type!
        
    }
    
}
