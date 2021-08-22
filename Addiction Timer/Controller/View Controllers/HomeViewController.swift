//
//  ViewController.swift
//  Addiction Timer
//
//  Created by Kenneth Dubroff on 8/22/21.
//

import UIKit
/// Lists Habits with timers
/// if no habits are found, start onboarding
class HomeViewController: UIViewController {
    
    var habits: [Habit] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        // TODO: load habits
        if habits.isEmpty {
            // TODO: launch add habit wizard
        }
    }


}

