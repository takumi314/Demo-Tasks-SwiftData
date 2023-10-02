//
//  Task.swift
//  Demo-Tasks-SwiftData
//
//  Created by NishiokaKohei on 2023/10/02.
//

import Foundation
import SwiftData

@Model
final class Task {
    @Attribute(.unique) var id: String = UUID().uuidString
    var title: String
    var dueDate: Date?
    var timestamp: Date

    init(title: String, dueDate: Date?, timestamp: Date) {
        self.title = title
        self.dueDate = dueDate
        self.timestamp = timestamp
    }
}
