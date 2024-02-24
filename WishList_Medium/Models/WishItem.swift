//
//  WishItem.swift
//  WishList_Medium
//
//  Created by Nicolò Curioni on 24/02/24.
//

import Foundation
import SwiftData

@Model
final class WishItem: Identifiable {
    var id = UUID()
    var name = ""
    var isCompleted = false
    var isNew = false
    var date = Date.now
    
    init(id: UUID = UUID(), name: String = "", isCompleted: Bool = false, isNew: Bool = false, date: Date = Date.now) {
        self.id = id
        self.name = name
        self.isCompleted = isCompleted
        self.isNew = isNew
        self.date = date
    }
}
