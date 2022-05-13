//
//  DetailView.swift
//  HabitTracker
//
//  Created by Lucas Chae on 5/13/22.
//

import SwiftUI

struct DetailView: View {
    
    @ObservedObject var myHabits: ActivityList
    let myActivity: Activity
    
    var body: some View {
        VStack{
            HStack {
                Text(myActivity.activityName)
                Text(myActivity.activityType)
                Text("\(myActivity.activityCount)")
            }
            Button("Add") {
                updateActivity(list: myHabits, activity: myActivity)
            }
            
           
        }
        
    }
    
    func addCount(activity: Activity) -> Activity {
        var counter = activity.activityCount
        counter += 1
        let completedActivity = Activity(name: activity.activityName, type: activity.activityType, count: counter)
        return completedActivity
    }
    
    func updateActivity(list: ActivityList, activity: Activity) -> Void {
        let temp = myHabits.activitiesArray.firstIndex(of: activity)
        myHabits.activitiesArray[temp!] = addCount(activity: activity)
        
    }
    
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(myHabits: ActivityList(), myActivity: Activity())
    }
}
