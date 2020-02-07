//
//  AddTaskViewModel.swift
//  ListAndDeleteApp
//
//  Created by Toni Tani on 3.2.2020.
//  Copyright © 2020 Toni Tani. All rights reserved.
//

import Foundation
import SwiftUI

class AddTaskViewModel {
    
    var name: String = ""
    var type: String = ""
    
    func saveTask() {
        CoreDataManager.shared.saveTask(name: self.name, type: self.type)
    }
}
