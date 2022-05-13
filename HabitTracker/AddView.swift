//
//  AddView.swift
//  HabitTracker
//
//  Created by Lucas Chae on 5/13/22.
//

import SwiftUI

struct AddView: View {
    
    @ObservedObject var myHabits: ActivityList
    @Environment(\.dismiss) var dismiss
    
    @State private var title = ""
    @State private var type = ""
    private let activityCount = 0
    
    var body: some View {
        NavigationView {
            Form{
                TextField("Name", text: $title)
                TextField("Type", text: $type)
            }
            .navigationTitle("Add new expense")
            .toolbar {
                Button("Add") {
                    let newItem = Activity(name: title, type: type, count: activityCount)
                    myHabits.activitiesArray.append(newItem)
                    dismiss()
                }
            }
        }
    }
}

struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        AddView(myHabits: ActivityList())
    }
}
