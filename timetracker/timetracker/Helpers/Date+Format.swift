//
//  Date+Format.swift
//  timetracker
//
//  Created by Поли Оранж on 20.03.2024.
//

import Foundation

extension Date {
    func toString() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss"
        return dateFormatter.string(from: self) + "Z"
    }
}
