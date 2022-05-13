//
//  Actiities.swift
//  HabitTracker
//
//  Created by Lucas Chae on 5/13/22.
//

import Foundation

struct Activity: Identifiable, Equatable, Codable {
    var id = UUID()
    let activityName: String
    let activityType: String
    var activityCount: Int

    
    
    init() {
        self.activityName = "Name"
        self.activityType = "Type"
        self.activityCount = 0
    }
    
    init(name: String, type: String, count: Int) {
        self.activityName = name
        self.activityType = type
        self.activityCount = count 
    }
}
