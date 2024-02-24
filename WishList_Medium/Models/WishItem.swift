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
    var date = Date.now
    var isCompleted = false
    var isNew = false
    
    init(id: UUID = UUID(), name: String = "", date: Date = Date.now, isCompleted: Bool = false, isNew: Bool = false) {
        self.id = id
        self.name = name
        self.date = date
        self.isCompleted = isCompleted
        self.isNew = isNew
    }
}
