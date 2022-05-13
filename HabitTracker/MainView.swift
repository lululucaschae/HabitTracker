//
//  ContentView.swift
//  HabitTracker
//
//  Created by Lucas Chae on 5/13/22.
//

import SwiftUI

struct MainView: View {
    
    @StateObject var myHabits = ActivityList()
    
    @State var displayAddSheet = false
    
    var body: some View {
        NavigationView {
            List {
                ForEach (myHabits.activitiesArray) {activity in
                    NavigationLink {
                        DetailView(myHabits: myHabits, myActivity: activity)
                    } label: {
                        HStack {
                            VStack {
                                Text("\(activity.activityName)")
                                Text("\(activity.activityType)")
                            }
                            Spacer()
                            Text("\(activity.activityCount)")
                        }
                    }
                    
                }
                .onDelete(perform: removeItems)
            }
            
            
            .navigationTitle("iHabit")
            .toolbar {
                Button {
                    displayAddSheet = true
                } label: {
                    Image(systemName: "plus")
                }
            }
            .sheet(isPresented: $displayAddSheet) {
                AddView(myHabits: myHabits)
            }
        }
    }
    
    func removeItems(at offsets: IndexSet) {
        myHabits.activitiesArray.remove(atOffsets: offsets)
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
