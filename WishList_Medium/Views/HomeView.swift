//
//  HomeView.swift
//  WishList_Medium
//
//  Created by Nicolò Curioni on 22/02/24.
//

import SwiftUI

struct WishItem: Identifiable, Hashable, Codable {
    var id = UUID()
    var symbol: String = ItemSymbols.randomName()
    var color: RGBAColor = ColorOptions.random().rgbaColor
    var name = ""
    var isCompleted = false
    var isNew = false
    var date = Date.now
}

struct HomeView: View {
    // MARK: - Properties
    @Environment(\.dismiss) private var dismiss
    
    @Binding var wishViewModel: WishViewModel
    @Binding var wishItem: WishItem
    @FocusState var focusedItem: WishItem?
    @State private var isAddingNewWishItem = false
    @State private var isPickingSymbol = false
    @State private var newWishItem = false
    
    // MARK: - View Life-cycle
    
    var body: some View {
        NavigationStack {
            List {
                HStack {
                    Button {
                        isPickingSymbol.toggle()
                    } label: {
                        Image(systemName: wishItem.symbol)
                            .imageScale(.large)
                            .foregroundStyle(Color(wishItem.color))
                    }
                    .buttonStyle(.plain)
                    .padding(.horizontal, 5)
                    
                    TextField("New Wish Item", text: $wishItem.name)
                        .font(.title2)
                }
                .padding(.top, 2)
                
                DatePicker("Date", selection: $wishItem.date)
                    .labelsHidden()
                    .listRowSeparator(.hidden)
                
                ForEach($wishViewModel.wishItems) { item in
                    WishItemRow(wishItem: item, focusedItem: $focusedItem)
                }
                .onDelete(perform: { indexSet in
                    wishViewModel.removeItem(indexSet)
                })
                
                Button {
                    let newItem = WishItem(name: wishItem.name, isCompleted: false, isNew: true)
                    wishViewModel.addItem(newItem)
                    focusedItem = newItem
                } label: {
                    HStack {
                        Image(systemName: "plus")
                        Text("Add Wish Item")
                    }
                }
                .buttonStyle(.borderless)
            }
            .navigationTitle("Wish Item")
            .navigationBarTitleDisplayMode(.automatic)
            .sheet(isPresented: $isPickingSymbol) {
                SymbolPicker(wishItem: $wishItem)
            }
        }
    }
}

#Preview {
    HomeView(wishViewModel: .constant(.init()), wishItem: .constant(.init()))
}

