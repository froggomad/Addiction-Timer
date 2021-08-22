//
//  Habit.swift
//  Addiction Timer
//
//  Created by Kenneth Dubroff on 8/22/21.
//

import Foundation

struct Habit {
    var name: String
    /// contains history of intervals as they change
    var intervals: [HabitInterval]
    var habitStarted: Date?
    
    var howLongKickingHabit: Date {
        intervals[0].dateStarted
    }
}

struct HabitInterval {
    var minutes: Int
    var dateStarted: Date
}
