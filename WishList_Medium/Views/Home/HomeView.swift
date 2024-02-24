//
//  HomeView.swift
//  WishList_Medium
//
//  Created by Nicolò Curioni on 22/02/24.
//

import SwiftUI

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
                ForEach(wishViewModel.wishItems) { item in
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
            .sheet(isPresented: self.$newWishItem) {
                OperationView()
            }
        }
    }
}

#Preview {
    HomeView(wishItem: .constant(.init()))
}

