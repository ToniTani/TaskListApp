//
//  ContentView.swift
//  ListAndDeleteApp
//
//  Created by Toni Tani on 3.2.2020.
//  Copyright © 2020 Toni Tani. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @Binding var isPresented: Bool
        @State var addOrderVM = AddTaskViewModel()
        
        var body: some View {
            
            NavigationView {
            
            Group {
            
            VStack {
                
                TextField("Enter name", text: self.$addOrderVM.name)
                
                Picker(selection: self.$addOrderVM.type, label: Text("")) {
                    Text("Cappuccino").tag("cap")
                    Text("Regular").tag("reg")
                    Text("Expresso").tag("ex")
                }.pickerStyle(SegmentedPickerStyle())
                
                Button("Add Task") {
                    // place order
                    self.addOrderVM.saveTask()
                   // self.isPresented = false
                    
                }.padding(8)
                    .foregroundColor(Color.white)
                    .background(Color.green)
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
