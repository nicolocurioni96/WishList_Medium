//
//  WishViewModel.swift
//  WishList_Medium
//
//  Created by Nicolò Curioni on 23/02/24.
//

import SwiftUI
import SwiftData

@Observable 
class WishViewModel {
    // MARK: - Properties
    var wishItems: [WishItem] = []
    
    // MARK: - Methods
    func addItem(_ item: WishItem) {
        // [WIP] - Currently with dummy data..
        wishItems.append(item)
    }
    
    func removeItem(_ indexSet: IndexSet) {
        // [WIP] - Currently with dummy data..
        wishItems.remove(atOffsets: indexSet)
    }
    
    func updateItem(_ item: WishItem) {
        // [WIP] - Currently with dummy data..
        
    }
}
