//
//  AddHabitIntervalViewController.swift
//  Addiction Timer
//
//  Created by Kenneth Dubroff on 8/22/21.
//

import UIKit

protocol IntervalUpdateDelegate {
    func updateInterval(_: HabitInterval)
}

class AddHabitIntervalView: UIView {
    weak var delegate: UIPickerViewDelegate?
    
    init(delegate: UIPickerViewDelegate) {
        self.delegate = delegate
        super.init(frame: .zero)
    }
    
    required init?(coder: NSCoder) {
        fatalError("programmatic view")
    }
    
    lazy var stackView: UIStackView = .componentStack(elements: [intervalPicker])
    
    lazy var intervalPicker: UIPickerView = {
        let picker = UIPickerView()
        picker.delegate = delegate
        picker.dataSource = self
        
        return picker
    }()
    
    private func setupViews() {
        addSubview(stackView)
        constraints()
    }
    
    private func constraints() {
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            stackView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),
            stackView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
            stackView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor)
        ])
    }
}

extension AddHabitIntervalView: UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        3
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        switch component {
        case 0:
            return 31
        case 1:
            return 23
        case 2:
            return 59
        default:
            return 0
        }
    }
    
}

class AddHabitIntervalViewController: UIViewController {
    var controller: AddHabitController
    lazy var pickerView = AddHabitIntervalView(delegate: self)
    
    init(controller: AddHabitController) {
        self.controller = controller
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("programmatic view")
    }
    
    override func loadView() {
        super.loadView()
        view = pickerView
    }
}

extension AddHabitIntervalViewController: UIPickerViewDelegate {
    
}

extension AddHabitIntervalViewController: IntervalUpdateDelegate {
    func updateInterval(_ habitInterval: HabitInterval) {
        controller.updateInterval(habitInterval)
    }
}
