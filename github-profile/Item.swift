//
//  Item.swift
//  github-profile
//
//  Created by Matheus Cardoso on 09/04/24.
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
