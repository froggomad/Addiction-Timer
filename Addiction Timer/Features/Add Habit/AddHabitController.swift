//
//  AddHabitController.swift
//  Addiction Timer
//
//  Created by Kenneth Dubroff on 8/22/21.
//

import Foundation

class AddHabitController {
    var habitTitle: String?
    var habitInterval: HabitInterval?
    
    func createHabit() -> Habit? {
        guard let title = habitTitle,
              let interval = habitInterval
        else { return nil }
        return Habit(name: title, intervals: [interval], habitStarted: Date())
    }
}
