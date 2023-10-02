//
//  Item.swift
//  Demo-Tasks-SwiftData
//
//  Created by NishiokaKohei on 2023/10/02.
//

import Foundation
import SwiftData

@Model
final class Item {
    var timestamp: Date
    
    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}
