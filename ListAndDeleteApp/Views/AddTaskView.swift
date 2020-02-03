//
//  AddTaskView.swift
//  ListAndDeleteApp
//
//  Created by Toni Tani on 3.2.2020.
//  Copyright © 2020 Toni Tani. All rights reserved.
//

import SwiftUI


struct AddTaskView: View {
    
    @State var addTaskVM = AddTaskViewModel()
    
    var body: some View {
        
        VStack {
            TextField("Add task", text: self.$addTaskVM.name)
        }
    }
}

struct AddTaskView_Previews: PreviewProvider {
    static var previews: some View {
        AddTaskView()
    }
}
