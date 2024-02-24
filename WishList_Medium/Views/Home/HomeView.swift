//
//  HomeView.swift
//  WishList_Medium
//
//  Created by Nicolò Curioni on 22/02/24.
//

import SwiftUI

final class WishItem: Identifiable {
    var id = UUID()
    var symbol: String = ItemSymbols.randomName()
    var color: RGBAColor = ColorOptions.random().rgbaColor
    var name = ""
    var isCompleted = false
    var isNew = false
    var date = Date.now
    
    init(id: UUID = UUID(), symbol: String, color: RGBAColor, name: String = "", isCompleted: Bool = false, isNew: Bool = false, date: Foundation.Date = Date.now) {
        self.id = id
        self.symbol = symbol
        self.color = color
        self.name = name
        self.isCompleted = isCompleted
        self.isNew = isNew
        self.date = date
    }
}

struct HomeView: View {
    // MARK: - Properties
    @Environment(\.dismiss) private var dismiss
    
    @State var wishViewModel = WishViewModel()
    @Binding var wishItem: WishItem
    @State private var isAddingNewWishItem = false
    @State private var isPickingSymbol = false
    @State private var newWishItem = false
    
    // MARK: - View Life-cycle
    
    var body: some View {
        NavigationStack {
            List {
                ForEach($wishViewModel.wishItems) { item in
                    WishItemRow(wishItem: item)
                }
                .onDelete(perform: { indexSet in
                    wishViewModel.removeItem(indexSet)
                })
            }
            .navigationTitle("Wish Item")
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        self.newWishItem = true
                    } label: {
                        Image(systemName: "plus.square.fill")
                            .font(.title)
                            .fontWeight(.medium)
                    }
                }
            }
            .navigationBarTitleDisplayMode(.automatic)
            .sheet(isPresented: $isPickingSymbol) {
                SymbolPicker(wishItem: $wishItem)
            }
            .sheet(isPresented: self.$newWishItem) {
                OperationView(wishItem: nil)
            }
        }
    }
}

#Preview {
    HomeView(wishItem: .constant(.init(symbol: ItemSymbols.randomName(), color: ColorOptions.random().rgbaColor)))
}

