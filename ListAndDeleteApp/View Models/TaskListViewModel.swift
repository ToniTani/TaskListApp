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
    var orders = [TaskViewModel]()
    
    init() {
        fetchAllOrders()
    }
    
    func deleteOrder(_ orderVM: TaskViewModel) {
        CoreDataManager.shared.deleteOrder(name: orderVM.name)
        fetchAllOrders()
    }
    
    func fetchAllOrders() {
        self.orders = CoreDataManager.shared.getAllOrders().map(TaskViewModel.init)
        print(self.orders)
    }

    
}

class TaskViewModel {
    
    var name = ""
    var type = ""
    
    init(order: Order) {
        self.name = order.name!
        self.type = order.type!
    }
    
}

