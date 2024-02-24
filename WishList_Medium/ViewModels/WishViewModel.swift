//
//  WishViewModel.swift
//  WishList_Medium
//
//  Created by Nicolò Curioni on 23/02/24.
//

import SwiftUI
import SwiftData

class WishViewModel {
    // MARK: - Properties
    @Environment(\.modelContext) private var modelContext

    @Query var wishItems: [WishItem]
    
    // MARK: - Methods
    func addItem(_ item: WishItem) {
        modelContext.insert(item)
    }
    
    func removeItem(_ indexSet: IndexSet) {
        for index in indexSet {
            modelContext.delete(wishItems[index])
        }
    }
}
