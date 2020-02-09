//
//  ContentView.swift
//  ListAndDeleteApp
//
//  Created by Toni Tani on 7.2.2020.
//  Copyright © 2020 Toni Tani. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var taskListVM: TaskListViewModel
    @State private var isPresented: Bool = false
    
    init() {
        self.taskListVM = TaskListViewModel()
    }
    
    private func delete(at offsets: IndexSet) {
        offsets.forEach { index in
            let taskVM = self.taskListVM.orders[index]
            self.taskListVM.deleteOrder(taskVM)
        }
    }
    
    var body: some View {
       
        NavigationView {
        
        List {
            
            ForEach(self.taskListVM.orders, id: \.name) { task in
                HStack {
                    Image(task.type)
                        .resizable()
                        .frame(width: 100, height: 100)
                        .cornerRadius(10)
                    
                    Text(task.name)
                        .font(.largeTitle)
                        .padding([.leading], 10)
                    
                }
            }.onDelete(perform: delete)
            
        }
        .sheet(isPresented: $isPresented, onDismiss: {
            print("ONDISMISS")
            self.taskListVM.fetchAllOrders()
        }, content: {
            AddTaskView(isPresented: self.$isPresented)
        })
        .navigationBarTitle("Tasks")
        .navigationBarItems(trailing: Button("Add New Task") {
            self.isPresented = true
        })
        }
        
    } // vie roskat, käy kaupassa
}

#if DEBUG
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif
