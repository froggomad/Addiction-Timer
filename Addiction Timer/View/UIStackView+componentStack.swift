//
//  UIStackView+componentStack.swift
//  Addiction Timer
//
//  Created by Kenneth Dubroff on 8/22/21.
//

import UIKit

extension UIStackView {
    static func componentStack(elements: [UIView], distribution: UIStackView.Distribution = .fillProportionally, verticalAlignment: UIStackView.Alignment = .fill, horizontalAlignment: UIStackView.Alignment = .top, spacing: CGFloat = 2) -> UIStackView {
        let stack = UIStackView(arrangedSubviews: elements)
        stack.axis = .vertical
        stack.distribution = distribution
        stack.alignment = verticalAlignment
        stack.spacing = spacing
        
        let horizontalStack = UIStackView(arrangedSubviews: [stack])
        horizontalStack.alignment = horizontalAlignment
        return horizontalStack
    }
}

