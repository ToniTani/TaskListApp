//
//  AddTaskView.swift
//  ListAndDeleteApp
//
//  Created by Toni Tani on 3.2.2020.
//  Copyright © 2020 Toni Tani. All rights reserved.
//

import SwiftUI

struct AddTaskView: View {
    @Binding var isPresented: Bool
        @State var addTaskVM = AddTaskViewModel()
        
        var body: some View {
            
            NavigationView {
            
            Group {
            
            VStack {
                
                TextField("Enter task", text: self.$addTaskVM.name)
                
                Picker(selection: self.$addTaskVM.type, label: Text("")) {
                    Text("Important!").tag("red")
                    Text("Normal").tag("green")
                    Text("Not Important").tag("blue")
                }.pickerStyle(SegmentedPickerStyle())
                
                Button("Add Task") {
                    // place order
                    self.addTaskVM.saveTask()
                   // self.isPresented = false
                    
                }.padding(8)
                    .foregroundColor(Color.white)
                    .background(Color.black)
                    .cornerRadius(10)
                
            }
            }.padding()
            
                
                .navigationBarTitle("Add Order")
            }
        }
    }

    #if DEBUG
    struct AddOrderView_Previews: PreviewProvider {
        static var previews: some View {
            AddTaskView(isPresented: .constant(false))
        }
    }
    #endif
