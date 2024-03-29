//
//  UIKit+AutoLayout.swift
//  timetracker
//
//  Created by Polina Egorova on 13.03.2024.
//

import UIKit

public extension UIView {
    static func autolayout() -> Self {
        let view = self.init()
        view.translatesAutoresizingMaskIntoConstraints = false

        return view
    }

    @discardableResult
    func autolayout() -> Self {
        translatesAutoresizingMaskIntoConstraints = false

        return self
    }
}

