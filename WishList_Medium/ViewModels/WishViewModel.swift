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
    var modelContext: ModelContext
    var wishItems = [WishItem]()
    
    init(modelContext: ModelContext) {
        self.modelContext = modelContext
        fetchWishItemData()
    }
    
    // MARK: - Methods
    func addItem(_ item: WishItem) {
        modelContext.insert(item)
        fetchWishItemData()
    }
    
    func removeItem(_ indexSet: IndexSet) {
        for index in indexSet {
            modelContext.delete(wishItems[index])
        }
        fetchWishItemData()
    }
    
    func fetchWishItemData() {
        do {
            let descriptor = FetchDescriptor<WishItem>(sortBy: [SortDescriptor(\.date)])
            wishItems = try modelContext.fetch(descriptor)
        } catch {
            print("🔴 Error: \(error.localizedDescription)")
        }
    }
}
