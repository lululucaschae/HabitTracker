//
//  ActivityList.swift
//  HabitTracker
//
//  Created by Lucas Chae on 5/13/22.
//

import Foundation

class ActivityList: ObservableObject {
    
    @Published var activitiesArray = [Activity]() {
        
        didSet {
            if let encoded = try? JSONEncoder().encode(activitiesArray) {
                UserDefaults.standard.set(encoded, forKey: "Activity")
            }
        }
    }
    
    init() {
        if let savedItems = UserDefaults.standard.data(forKey: "Activity") {
            if let decodedItems = try? JSONDecoder().decode([Activity].self, from: savedItems) {
                activitiesArray = decodedItems
                return
            }
        }
        activitiesArray = []
    }
    
}
