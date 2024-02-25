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
    var modelContext: ModelContext? = nil
    var wishItems = [WishItem]()
    
    init(modelContext: ModelContext? = nil) {
        self.modelContext = modelContext
        fetchWishItemData()
    }
    
    // MARK: - Methods
    func addItem(_ item: WishItem) {
        guard let modelContext else { return }
        
        modelContext.insert(item)
        fetchWishItemData()
    }
    
    func removeItem(_ indexSet: IndexSet) {
        guard let modelContext else { return }
        
        for index in indexSet {
            modelContext.delete(wishItems[index])
        }
        fetchWishItemData()
    }
    
    func fetchWishItemData() {
        guard let modelContext else { return }
        
        do {
            let descriptor = FetchDescriptor<WishItem>(sortBy: [SortDescriptor(\.date)])
            wishItems = try modelContext.fetch(descriptor)
        } catch {
            print("🔴 Error: \(error.localizedDescription)")
        }
    }
}
