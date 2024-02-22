//
//  Item.swift
//  WishList_Medium
//
//  Created by Nicolò Curioni on 22/02/24.
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
