//
//  AddHabitTitleViewController.swift
//  Addiction Timer
//
//  Created by Kenneth Dubroff on 8/22/21.
//

import UIKit

protocol TitleUpdateDelegate: NSObject {
    func updateTitle(_ title: String)
}

class AddStringView: UIView {
    
    private var placeholderText: String
    
    private lazy var stackView: UIStackView = .componentStack(elements: [textField])

    private lazy var textField: UITextField = {
        let textField = UITextField()
        textField.placeholder = placeholderText
        return textField
    }()
    
    var text: String? {
        textField.text
    }
    
    init(placeholder: String) {
        placeholderText = placeholder
        super.init(frame: .zero)
    }
    
    required init?(coder: NSCoder) {
        fatalError("programmatic view")
    }
    
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

class AddTitleViewController: UIViewController {
    
    lazy var titleView = AddStringView(placeholder: "Habit name (ex: \"Smoking Cigarettes\")")
    var controller = AddHabitController()
    
    override func loadView() {
        super.loadView()
        view = titleView
    }
    
    func presentIntervalController() {
        let viewController = AddHabitIntervalViewController(controller: controller)
        present(viewController, animated: true)
    }
    
}

extension AddTitleViewController: TitleUpdateDelegate {
    func updateTitle(_ title: String) {
        controller.updateTitle(title)
    }
}
