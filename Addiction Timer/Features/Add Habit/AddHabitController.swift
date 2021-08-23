//
//  AddHabitController.swift
//  Addiction Timer
//
//  Created by Kenneth Dubroff on 8/22/21.
//

import Foundation

class AddHabitController {
    private var habitTitle: String?
    private var habitInterval: HabitInterval?
    
    func createHabit() -> Habit? {
        Habit(name: habitTitle, interval: habitInterval)
    }
}

extension Habit {
    init?(name: String?, interval: HabitInterval?) {
        guard let name = name,
              let interval = interval
        else { return nil }
        
        self.init(name: name, intervals: [interval], habitStarted: Date())
    }
}
